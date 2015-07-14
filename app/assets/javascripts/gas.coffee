# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

  $.ajax 'http://maps.googleapis.com/maps/api/geocode/json?address=84095&sensor=false',
  type: 'GET'
  success: (data) ->
    lat = data.results[0].geometry.location.lat
    lng = data.results[0].geometry.location.lng
    $('.change-me').html('Lat: ' + lat + ', ' + 'Lon: ' + lng + '<br><br>')
    getGas(lat, lng)

  error: (data) ->
    console.log data

  getGas = (lat, lng) ->
    $.ajax 'http://api.mygasfeed.com/stations/radius/' + lat + '/' + lng + '/10/reg/price/5y5b8lmnrb.json',
      type: 'GET'
      success: (data) ->
        #$('.change-me').html('Cheapest gas near you is: $' + cheapgas + '<br>' + station + '<br>' + address )
        i = 0
        while i < 10
          cheapgas = data.stations[i].reg_price
          station = data.stations[i].station
          address = data.stations[i].address
          $('.change-me').append '$' + cheapgas + '<br>' + station + '<br>' + address + '<br><br>'
          i++
      error: (data) ->
        console.log data
