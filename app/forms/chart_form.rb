class ChartForm
  include ActiveModel::Model

  attr_accessor :type, :days

  def initialize(type, days)
    self.type = type
    self.days = days
  end

  def type_collection
    keys = Entry.examination_types.keys
    keys.shift(2)
    results = [ [ 'Blood pressure', :blood_pressure ] ]
    keys.map do |type, _|
      results << [I18n.t(type, scope: :examination_types), type]
    end
    results
  end

  private

  def translate_type(type)
    I18n.t(type, scope: :examination_types)
  end
end