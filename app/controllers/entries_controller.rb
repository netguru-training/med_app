class EntriesController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_patient, only: [:new, :create]

  expose_decorated(:current_user_entries, decorator: EntriesDecorator) {current_user.entries.page params[:page]  }
  expose(:user)
  expose(:users)
  expose_decorated(:entry)
  expose(:decorated_entry_collection) do
    EntryDecorator.decorate_collection(current_user.entries.for_examination(params[:category_type]).page params[:page])
  end
  expose_decorated(:my_patients_entries, decorator: EntryDecorator) do
    DoctorPatientsEntriesRepository.new(current_user).all.page params[:page]
  end
  expose(:examination_types) { CategoryDecorator.decorate_collection(Entry.examination_types.keys) }

  def index

  end

  def show
    self.entry = EntryDecorator.decorate Entry.find(params[:id])
  end

  def new
  end

  def activity_log
  end

  def categories
  end

  def create
    self.entry = Entry.new(entry_params)
    entry.user_id = current_user.id

    if entry.save
      redirect_to entry_path(entry), notice: 'Entry was successfully created.'
    else
      render 'new'
    end
  end

  def entry_params
    params.require(:entry).permit(:date, :examination_type, :value, :description)
  end
end
