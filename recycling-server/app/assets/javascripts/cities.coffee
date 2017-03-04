# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#category-paper-details').addClass('category-details-active');

  $('.city-slider-container button').click ->
    $('.category-details').removeClass('category-details-active');
    $("##{$(this).attr('id')}-details").addClass('category-details-active');
