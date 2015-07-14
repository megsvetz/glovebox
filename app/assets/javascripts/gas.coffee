# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

  zip_code = $('.test-it-out').data('zipcode')
  $('.test-it-out').click ->
    $.ajax 'http://maps.googleapis.com/maps/api/geocode/json?address=' + zip_code + '&sensor=false',
    type: 'GET'
    success: (data) ->
      lat = data.results[0].geometry.location.lat
      lng = data.results[0].geometry.location.lng
      $('.change-me').html('Lat: ' + lat + ', ' + 'Lon: ' + lng + '<br><br>')
      getGas(lat, lng)
      sendCoord(lat, lng)
    error: (data) ->
      console.log data

  getGas = (lat, lng) ->
    $.ajax 'http://api.mygasfeed.com/stations/radius/' + lat + '/' + lng + '/10/reg/price/5y5b8lmnrb.json',
      type: 'GET'
      success: (data) ->
        #$('.change-me').html('Cheapest gas near you is: $' + cheapgas + '<br>' + station + '<br>' + address )
        gasstations = 10
        i = 0
        while i < gasstations
          cheapgas = data.stations[i].reg_price
          if cheapgas is 'N/A'
            gasstations += 1
          else
            station = data.stations[i].station
            address = data.stations[i].address
            city = data.stations[i].city
            state = data.stations[i].region
            $('.change-me').append '$' + cheapgas + '<br>' + station + '<br>' + address + '<br>' + city + ', ' + state + '<br><br>'
          i++
      error: (data) ->
        console.log data

  sendCoord = (lat, lng) ->
    console.log 'on coord' + lat
    $.ajax '/gas/coords',
      type: 'GET'
      data: {latitude: lat, long: lng}
      success: (data) ->
        console.log data
      error: (data) ->
        console.log data
