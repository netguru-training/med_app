$(document).on 'ready page:load', ->

  $('form#new_chart_form').on 'change', ->
    $(this).submit()

  $('form#new_chart_form').on 'submit', (e) ->
    params = ( $( this ).serialize() )
    $.ajax
      dataType: "json"
      url: "/dashboard.json"
      data: params
      success: (data) ->
        $("h2#chart_title").text('fdsf')
        new Chart($("canvas#chart").get(0).getContext("2d")).Line(data)
    e.preventDefault()