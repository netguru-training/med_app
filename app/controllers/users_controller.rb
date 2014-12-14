class UsersController < ApplicationController
  before_filter :authenticate_user!

  expose(:user)
  expose(:users)
  expose(:alert) { Alert.new }

  def show
    unless user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def summary
  end


end
