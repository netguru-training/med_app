class EntriesController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_patient, only: [:new, :create]

  expose(:user)
  expose(:users)
  expose_decorated(:entry)
  expose(:entries)
  expose(:my_patients_entries) do
    DoctorPatientsEntriesRepository.new(current_user).all
  end
  expose(:examination_types) { CategoryDecorator.decorate_collection(Entry.examination_types.keys) }

  def index
  end

  def show
  end

  def new
  end

  def activity_log
  end

  def categories
    ex_type = Entry.examination_types[params[:category_type]]
    self.entries = current_user.entries.where(examination_type: ex_type)
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
