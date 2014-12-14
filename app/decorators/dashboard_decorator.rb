class DashboardDecorator < Draper::Decorator
delegate_all
def alert_color
  if object.warnings != ""
    'alert-danger'
  end
end

end
