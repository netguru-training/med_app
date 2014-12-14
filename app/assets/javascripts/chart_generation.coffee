$(document).on 'ready page:load', ->

  $.getJSON("/dashboard.json", (data) ->
    drawCharts(data.blood_pressure, 'Blood pressure')
  )

  $(".btn-group#chart-list ul.dropdown-menu li#blood_pressure").click ->
    drawCharts('blood_pressure', 'Blood pressure')
  $(".btn-group#chart-list ul.dropdown-menu li#weight").click ->
    drawCharts('weight', 'Weight')
  $(".btn-group#chart-list ul.dropdown-menu li#heart_rate").click ->
    drawCharts('heart_rate', 'Heart rate')
  $(".btn-group#chart-list ul.dropdown-menu li#sugar_level").click ->
    drawCharts('sugar_level', 'Sugar level')

drawCharts = (chartData, chartTitle) ->
  $.getJSON("/dashboard.json", (data) ->
    new Chart($("canvas#chart").get(0).getContext("2d")).Line(data[chartData])
    $("h2#chart_title").text(chartTitle)
  )