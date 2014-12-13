class PatientsController < ApplicationController

  before_action :authenticate_user!

  expose(:patients) { current_user.patients.page params[:page] }

  def index
  end
end
