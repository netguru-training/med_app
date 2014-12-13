
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
      {
        fillColor : "rgba(220,220,220,0.5)"
        strokeColor : "rgba(220,220,220,1)"
        pointColor : "rgba(220,220,220,1)"
        pointStrokeColor : "#fff"
        data: gon.chart_data.blood_pressure_in.datasets[0].data }
      {
        fillColor : "rgba(151,187,205,0.5)"
        strokeColor : "rgba(151,187,205,1)"
        pointColor : "rgba(151,187,205,1)"
        pointStrokeColor : "#fff"
        data: gon.chart_data.blood_pressure_out.datasets[0].data }
    ]
  }

  bloodPressureChart = new Chart($("#blood-pressure-chart").get(0).getContext("2d")).Line(bloodPressureData)

  weightChart = new Chart($("#weight-chart").get(0).getContext("2d")).Line(gon.chart_data.weight)
  heartRateChart = new Chart($("#heart-rate-chart").get(0).getContext("2d")).Line(gon.chart_data.heart_rate)
  sugarLevelChart = new Chart($("#sugar-level-chart").get(0).getContext("2d")).Line(gon.chart_data.sugar_level)
