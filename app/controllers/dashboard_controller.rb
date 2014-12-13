class DashboardController < ApplicationController

  before_action :authenticate_user!

  expose(:entries) { current_user.entries }

  def index
    gon.chart_data = { }

    entries.examination_types.keys.each do |type|
      gon.chart_data[type] = {
        labels: entries.public_send(type).pluck(:date) ,
        values: entries.public_send(type).pluck(:value)
      }
    end
  end

end
