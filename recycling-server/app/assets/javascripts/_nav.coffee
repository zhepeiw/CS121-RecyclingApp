$(document).ready ->

  $('#navSearchTerm').focus ->
    $('.recico-nav-container').addClass('nav-search-active');

  $('#navSearchTerm').focusout ->
    $('.recico-nav-container').removeClass('nav-search-active');
