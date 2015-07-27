# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#get-mechanic').click ->
    $("#loading_gif").removeClass('hidden')
    $.ajax '/mechanics/update',
      type: 'GET'
      data: zip_code: $('#mechanics_zip').val()
      success: (data) ->
        #console.log data
        $("#loading_gif").addClass('hidden')
        $('.mechanics_div').html('')
        console.log data.businesses
        i = 0
        while i < data.businesses.length
          $('.mechanics_div').append('<div class="col-sm-4"><u><a href="' + data.businesses[i].url + '">' + data.businesses[i].name + '</a></u><br>' + data.businesses[i].location.display_address[0] + '<br>' + data.businesses[i].location.display_address[2] + '<br>' + data.businesses[i].display_phone + '<br><img src="' + data.businesses[i].rating_img_url_large + '" height="18" width="100"><br><br><i>"' + data.businesses[i].snippet_text + '"</i><br><hr /></div>')
          i++
      error: (data) ->
        console.log data
