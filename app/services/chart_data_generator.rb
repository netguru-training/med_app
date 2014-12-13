class ChartDataGenerator
  attr_accessor :entries

  def initialize(entries)
    self.entries = entries
  end

  def generate
    result = {}
    entries.examination_types.keys.each do |type|
      result[type] = {
        labels: entries.public_send(type).pluck(:date) ,
        datasets: [
          data: entries.public_send(type).pluck(:value)
        ]
      }
    end
    result
  end
end
