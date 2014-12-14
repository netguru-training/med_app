$ ->
  drawCharts(gon.chart_data.blood_pressure, 'Blood pressure')

  $(".btn-group#chart-list ul.dropdown-menu li#blood_pressure").click ->
    drawCharts(gon.chart_data.blood_pressure, 'Blood pressure')

  $(".btn-group#chart-list ul.dropdown-menu li#weight").click ->
    drawCharts(gon.chart_data.weight, 'Weight')

  $(".btn-group#chart-list ul.dropdown-menu li#heart_rate").click ->
    drawCharts(gon.chart_data.heart_rate, 'Heart rate')

  $(".btn-group#chart-list ul.dropdown-menu li#sugar_level").click ->
    drawCharts(gon.chart_data.sugar_level, 'Sugar level')


drawCharts = (chartData, chartTitle) ->
  new Chart($("canvas#chart").get(0).getContext("2d")).Line(chartData)
  $("h2#chart_title").text(chartTitle)
