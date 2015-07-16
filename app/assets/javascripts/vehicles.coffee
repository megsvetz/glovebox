# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#vehicle_vin').change ->
    vin = $('#vehicle_vin').val()
    $.ajax 'https://api.edmunds.com/v1/api/toolsrepository/vindecoder?vin=' + vin + '&fmt=json&api_key=fppzq3ry7cv83shhqwe4kjn2',
      type: 'GET'
      success: (data) ->
        $('#vehicle_make').val(data.styleHolder[0].makeName)
        $('#vehicle_model').val(data.styleHolder[0].modelName)
        $('#vehicle_type').val(data.styleHolder[0].categories.PRIMARY_BODY_TYPE)
        $('#vehicle_year').val(data.styleHolder[0].year)
        $('#vehicle_make').attr('disabled', 'true')
        $('#vehicle_model').attr('disabled', 'true')
        $('#vehicle_type').attr('disabled', 'true')
        $('#vehicle_year').attr('disabled', 'true')
        $('#vehicle_vin').attr('disabled', 'true')
      error: (data) ->
        alert 'That VIN does not appear to be correct, please enter it again.'

  $('#registration_modal_button').click ->
    $('#registration_modal').modal({backdrop: 'static', keyboard: false})

  $('#insurance_modal_button').click ->
    $('#insurance_modal').modal({backdrop: 'static', keyboard: false})
