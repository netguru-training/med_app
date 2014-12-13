class ChartDataGenerator
  attr_accessor :entries

  def initialize(entries)
    self.entries = entries
  end

  def generate
    result = {}
    keys = entries.examination_types.keys
    blood_pressure_keys = keys.shift(2)
    keys.each do |type|
      result[type] = {
        labels: entries.public_send(type).pluck(:date) ,
        datasets: [
          data: entries.public_send(type).pluck(:value)
        ]
      }
    end
    result[:blood_pressure] = {
      labels: (entries.blood_pressure_in.pluck(:date) + entries.blood_pressure_out.pluck(:date)).uniq,
      datasets: [
        {
          fillColor: "rgba(220,220,220,0.5)",
          strokeColor: "rgba(220,220,220,1)",
          pointColor: "rgba(220,220,220,1)",
          pointStrokeColor: "#fff",
          data: entries.blood_pressure_in.pluck(:value)
        },
        {
          fillColor: "rgba(151,187,205,0.5)",
          strokeColor: "rgba(151,187,205,1)",
          pointColor: "rgba(151,187,205,1)",
          pointStrokeColor: "#fff",
          data: entries.blood_pressure_out.pluck(:value)
        }
      ]
    }
    result
  end
end
