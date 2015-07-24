# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#get-mechanic').click ->
    $.ajax '/mechanics',
      type: 'GET'
      data: zip_code: $('#mechanics_zip').val()
      success: (data) ->
        console.log data
      error: (data) ->
        console.log data
