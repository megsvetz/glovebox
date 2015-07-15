# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.bio').hover ->
    $(this).css('cursor', 'pointer')

  $('#brad').hover ->
    $('#brad').popover('toggle')

  $('#carter').hover ->
    $('#carter').popover('toggle')
  
  $('#meg').hover ->
    $('#meg').popover('toggle')
  
  $('#steve').hover ->
    $('#steve').popover('toggle')
