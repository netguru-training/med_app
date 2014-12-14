class AlertsController < ApplicationController

expose_decorated(:alerts, decorator: AlertDecorator) { current_user.alerts }
expose(:alert)

  def index
  end

  def show
  end

  def new
  end

  def destroy
  end

  def update
    a = Alert.find(params[:id])
    a.update(acknowledge: true)
    redirect_to alerts_path
  end

  def create
    self.alert = Alert.new(alert_params)
    alert.doctor_id = current_user.id
    alert.user_id = params[:user_id]

    if alert.save
      redirect_to summary_user_path(params[:user_id]), notice: 'Alert was successfully created.'
    else
      render 'new'
    end
  end

  def alert_params
    params.require(:alert).permit(:content)
  end

end
