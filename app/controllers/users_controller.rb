class UsersController < ApplicationController
  before_filter :authenticate_user!

  expose(:user)
  expose(:users)

  def show
    unless user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def summary
  end

  def add_patient
  end

  def update_patient_doctor
    patient = User.find_by_token(params[:user][:token])
    
    if patient.present?
      patient.update(doctor_id: current_user.id)
      redirect_to patients_path
    else
      redirect_to :back, :alert => "Patient not find."
    end
  end

end
