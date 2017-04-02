# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.flexslider').flexslider({
    animation: "slide",
    animationLoop: false,
    itemWidth: 200,
    minItems: 3,
    maxItems: 5,
  })

  $('#category-paper-details').addClass('category-details-active')

  $('.city-slider-container button').click ->
    $('.category-details').removeClass('category-details-active')
    $("##{$(this).attr('id')}-details").addClass('category-details-active')

  $(".chosen-select-category")
    .chosen({ width: "100%" })
    .change((event) ->
      $(".chosen-select-category").trigger('chosen:updated')
      selectedCategories = $(event.target).val()
      $('.subcategory-selector').removeClass('active')
      selectedCategories.forEach((categoryId) ->
        $("#subcategory-selector-#{categoryId}").addClass('active'))
    )

  $(".chosen-select-subcategory")
    .chosen({ width: "100%" })

  Dropzone.autoDiscover = false

  dropzone = new Dropzone(".dropzone", {
      url: "/cities",
      maxFilesize: 256,
      paramName: "city[image_link]",
      addRemoveLinks: false
  })
