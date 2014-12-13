
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require Chart
#= require_tree .
#= require_self

$ ->
  bloodPressureData = {
    labels: gon.chart_data.blood_pressure_out.labels
    datasets: [
      { data: gon.chart_data.blood_pressure_in.values }
      { data: gon.chart_data.blood_pressure_out.values }
    ]
  }

  bloodPressureChart = new Chart($("#blood-pressure-chart").get(0).getContext("2d")).Line(bloodPressureData)
