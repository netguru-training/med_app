class ChartForm
  include ActiveModel::Model

  attr_accessor :type, :days

  def initialize(type, days)
    self.type = type
    self.days = days
  end
end