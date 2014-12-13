class EntriesController < ApplicationController

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

end