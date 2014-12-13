class PatientsController < ApplicationController
  expose(:patients) { current_user.patients }

  def index
  end
end
