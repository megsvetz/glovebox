# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#vehicle_vin').change ->
    vin = $('#vehicle_vin').val()
    api = $('.vin-number').data('api')
    $.ajax 'https://api.edmunds.com/v1/api/toolsrepository/vindecoder?vin=' + vin + '&fmt=json&api_key=' + api,
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

  $('.registration_modal_button').click ->
    vehicle = $(@).data('vehicle')
    vehicleId = vehicle.id
    registrationId = vehicle
    $.ajax "/vehicles/#{vehicleId}/registrations/#{vehicle.registration.id}?layout=false",
      type: 'GET'
      success: (data) ->
        $('#registration_modal .modal-body').html(data)
        $('#registration_modal .modal-dialog').css
          width:'auto'
          height:'auto'
        $('#registration_modal').modal('show')
      error: ->
        $('#registration_modal').modal('show')

  $('.insurance_modal_button').click ->
      vehicle = $(@).data('vehicle')
      vehicleId = vehicle.id
      insuranceId = vehicle
      $.ajax "/vehicles/#{vehicleId}/insurances/#{vehicle.insurance.id}?layout=false",
        type: 'GET'
        success: (data) ->
          $('#insurance_modal .modal-body').html(data)
          $('#insurance_modal .modal-dialog').css
            width:'auto'
            height:'auto'
          $('#insurance_modal').modal('show')
        error: ->
          $('#insurance_modal').modal('show')

  $('#registration_modal_button_show').click ->
    $('#registration_modal').modal('show')

  $('#insurance_modal_button_show').click ->
    $('#insurance_modal').modal('show')

  $('a[rel*=lazybox]').lazybox({esc: true, close: true, modal: true, klass: 'class'});

  $('#h3_10').click ->
    $('#num10').toggle ->

  $('#h3_9').click ->
    $('#num9').toggle ->

  $('#h3_9').click ->
    $('#num9').toggle ->

  $('#h3_8').click ->
    $('#num8').toggle ->

  $('#h3_7').click ->
    $('#num7').toggle ->

  $('#h3_6').click ->
    $('#num6').toggle ->

  $('#h3_5').click ->
    $('#num5').toggle ->

  $('#h3_4').click ->
    $('#num4').toggle ->

  $('#h3_3').click ->
    $('#num3').toggle ->

  $('#h3_2').click ->
    $('#num2').toggle ->

  $('#h3_1').click ->
    $('#num1').toggle ->

  $('.h3_classes').hover ->
    $('.h3_classes').css('cursor','pointer');


# $(".modal-body").load($(this).data('href'))
