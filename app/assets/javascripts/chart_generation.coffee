$ ->
  bloodPressureChart = new Chart($("#blood-pressure-chart").get(0).getContext("2d")).Line(gon.chart_data.blood_pressure)
  weightChart = new Chart($("#weight-chart").get(0).getContext("2d")).Line(gon.chart_data.weight)
  heartRateChart = new Chart($("#heart-rate-chart").get(0).getContext("2d")).Line(gon.chart_data.heart_rate)
  sugarLevelChart = new Chart($("#sugar-level-chart").get(0).getContext("2d")).Line(gon.chart_data.sugar_level)
