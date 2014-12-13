class PatientsController < ApplicationController
  expose(:patients) { current_user.patients.page params[:page] }

  def index
  end
end
