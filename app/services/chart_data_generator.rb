class ChartDataGenerator
  attr_accessor :entries

  def initialize(entries)
    self.entries = entries
  end

  def generate(type)
    results = {}
    if type == 'blood_pressure'
      results = {
        labels: (entries.blood_pressure_in.pluck(:date) + entries.blood_pressure_out.pluck(:date)).uniq.map {|d| d.to_date} ,
        datasets: [
          {
            fillColor: "rgba(186,57,57,0.5)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            data: entries.blood_pressure_in.pluck(:value)
          },
          {
            fillColor: "rgba(61,100,168,0.5)",
            strokeColor: "rgba(61,100,168,1)",
            pointColor: "rgba(61,100,168,1)",
            pointStrokeColor: "#fff",
            data: entries.blood_pressure_out.pluck(:value)
          }
        ]
      }
    else
      results = {
        labels: entries.public_send(type).pluck(:date).map {|d| d.to_date} ,
        datasets: [
          fillColor: "rgba(151,187,205,0.5)",
          strokeColor: "rgba(151,187,205,1)",
          pointColor: "rgba(151,187,205,1)",
          pointStrokeColor: "#fff",
          data: entries.public_send(type).pluck(:value)
        ]
      }
    end
    results
  end
end
