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

  Dropzone.autoDiscover = false

  dropzone = new Dropzone(".dropzone", {
      url: "/cities",
      maxFilesize: 256,
      paramName: "city[image_link]",
      addRemoveLinks: false
  })

  numFacilities = 1

  $("#add-facility").click(() ->
    $("#facility-#{numFacilities}").html("""
      <td>#{numFacilities+1}</td>
      <td>
          <input  name='facility-name-#{numFacilities}' type='text' placeholder='Name'  class='form-control input-md'>
      </td>
      <td>
          <input  name='facility-location#-#{numFacilities}' type='text' placeholder='Location'  class='form-control input-md'>
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

  initMap = ->
  geocoder = new (google.maps.Geocoder)
  map = new (google.maps.Map)(document.getElementById('map'), zoom: 12)
  centerDidSet = false
  infoWindow = new (google.maps.InfoWindow)
  # Add a marker clusterer to manage the markers.
  markerCluster = new MarkerClusterer(map, null, imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m')
  url = window.location.href
  id = url.split('/').pop().split('?')[0]
  getURL = '../api/v1/cities/' + id + '/facilities'
  $.getJSON getURL, (data) ->
    facilities = data['facilities']
    facilities.map (facility) ->
      name = facility['name']
      streetAddress = facility['street_address']
      zipcode = facility['zipcode']
      phoneNumber = facility['phone_number']
      website = facility['website']
      geocoder.geocode { address: streetAddress }, (results, status) ->
        if status == google.maps.GeocoderStatus.OK
          location = results[0].geometry.location
          if !centerDidSet
            map.setCenter location
            centerDidSet = true
          marker = new (google.maps.Marker)(position: location)
          infowincontent = document.createElement('div')
          titleElement = document.createElement('strong')
          titleElement.textContent = name
          infowincontent.appendChild titleElement
          infowincontent.appendChild document.createElement('br')
          if phoneNumber != null
            phoneElement = document.createElement('text')
            phoneElement.textContent = phoneNumber
            infowincontent.appendChild phoneElement
            infowincontent.appendChild document.createElement('br')
          if website != null
            websiteElement = document.createElement('a')
            websiteElement.textContent = website
            websiteElement.href = 'http://' + website
            infowincontent.appendChild websiteElement
            infowincontent.appendChild document.createElement('br')
          addressElement = document.createElement('text')
          addressElement.textContent = streetAddress
          infowincontent.appendChild addressElement
          marker.addListener 'click', ->
            infoWindow.setContent infowincontent
            infoWindow.open map, marker
            return
          markerCluster.addMarker marker
        return
      return
    return
  return
