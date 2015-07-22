# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.bio').hover ->
    $(this).css('cursor', 'pointer')

  $('#brad').click ->
    $('#brad').popover('toggle')

  $('#carter').click ->
    $('#carter').popover('toggle')

  $('#meg').click ->
    $('#meg').popover('toggle')

  $('#steve').click ->
    $('#steve').popover('toggle')

  $('#send_button').click ->
    if $('#contact_first_name').val() is '' or $('#contact_last_name').val() is '' or $('#contact_email').val() is '' or $('#contact_message').val() is ''
      alert 'Please fill in all fields.'
    else
      $.ajax '/contact',
        type: 'POST'
        data: contact: {first_name: $('#contact_first_name').val(), last_name: $('#contact_last_name').val(), email: $('#contact_email').val(), phone: $('#contact_phone').val(), message: $('#contact_message').val()}
        success: (data) ->
          blank_form()
          alert 'Thanks for the email!'
        error: (data) ->
          alert 'Something went wrong, please try again!'

  $('#clear_form').click ->
    blank_form()

  blank_form = ->
    $('#contact_first_name').val('')
    $('#contact_last_name').val('')
    $('#contact_email').val('')
    $('#contact_phone').val('')
    $('#contact_message').val('')
