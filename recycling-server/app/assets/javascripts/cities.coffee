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

      if selectedCategories.length > 0
        selectedCategories.forEach((categoryId) ->
          $("#subcategory-selector-#{categoryId}").addClass('active'))
    )

  $(".chosen-select-subcategory")
    .chosen({ width: "100%" })

  numFacilities = 1

  $("#add-facility").click(() ->
    genIdAndNameForField = (fieldName) ->
      id: "city_facilities_attributes_#{numFacilities}_#{fieldName}"
      name: "city[facilities_attributes][#{numFacilities}][#{fieldName}]"

    { id: nameId, name: nameName } = genIdAndNameForField("name")
    { id: addressId, name: addressName } = genIdAndNameForField("street_address")
    { id: websiteId, name: websiteName } = genIdAndNameForField("website")

    $("#facility-#{numFacilities}").html("""
      <td>#{numFacilities+1}</td>
      <td>
          <input type="text"
                 id='#{nameId}' name='#{nameName}'
                 placeholder='Name'  class='form-control input-md'>
      </td>
      <td>
          <input type="text"
                 id='#{addressId}' name='#{addressName}'
                 placeholder='Name'  class='form-control input-md'>
      </td>
      <td>
          <input type="text"
                 id='#{websiteId}' name='#{websiteName}'
                 placeholder='Name'  class='form-control input-md'>
      </td>
      """)

    ++numFacilities
    $('#facilities-table').append("<tr id='facility-#{numFacilities}'></tr>")
  )

  $("#delete-facility").click(() ->
    if numFacilities > 1
      --numFacilities
      $("#facility-#{numFacilities}").html('')
  )

  Dropzone.autoDiscover = false

  dropzone = new Dropzone(".dropzone", {
    url: "/cities",
    maxFilesize: 256,
    paramName: "city[image_link]",
    addRemoveLinks: false
  })