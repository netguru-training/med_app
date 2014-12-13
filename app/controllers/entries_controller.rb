class EntriesController < ApplicationController

  before_action :authenticate_patient, only: [:new, :create]

  expose(:user)
  expose(:users)
  expose_decorated(:entry)
  expose(:entries)
  expose(:my_patients_entries) do
    DoctorPatientsEntriesRepository.new(current_user).all
  end

  def show
  end

  def new
  end

  def activity_log
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
