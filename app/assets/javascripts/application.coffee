
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require Chart
#= require_tree .
#= require_self

$ ->
  labels = [
    "January"
    "February"
    "March"
    "April"
    "May"
    "June"
    "July"
  ]

  values = [
        65
        59
        90
        81
        56
        55
        40
      ]

  data = {
    labels: labels
    datasets: [
      {
        data: values
      }
    ]
  }

  myNewChart = new Chart($("#myChart").get(0).getContext("2d")).Line(data)
