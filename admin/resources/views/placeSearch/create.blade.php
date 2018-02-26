@extends('master-layout')

@section('title')
	{{ $title }}
@endsection

@section('content')
	<form action="{{ route('storePlaceSearch') }}?id={{ $_GET['id'] }}&state={{ $_GET['state'] }}" method="POST" enctype="multipart/form-data">
		{{ csrf_field() }}
	    <input id="pac-input" type="text" name="location" class="form-control" placeholder="Enter a location">
      <input type="hidden" name="lat" id="lat">
      <input type="hidden" name="lng" id="lng">

	    <div id="map"></div>

	    <div id="infowindow-content">
	      <img src="" width="16" height="16" id="place-icon">
	      <span id="place-name"  class="title"></span><br>
	      <span id="place-address"></span>
	    </div>

	    <div class="text-center m-3"><button type="submit" class="btn btn-lg btn-primary col-md-4">Set Location</button></div>
	</form>

	<script>

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 0, lng: 0},
          zoom: 13
        });
        var card = document.getElementById('pac-card');
        var input = document.getElementById('pac-input');
        var lat = document.getElementById('lat');
        var lng = document.getElementById('lng');
        var types = document.getElementById('type-selector');
        var strictBounds = document.getElementById('strict-bounds-selector');

        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

        var autocomplete = new google.maps.places.Autocomplete(input);

        // Bind the map's bounds (viewport) property to the autocomplete object,
        // so that the autocomplete requests use the current map bounds for the
        // bounds option in the request.
        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        });

        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }

          infowindowContent.children['place-icon'].src = place.icon;
          infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-address'].textContent = address;
          infowindow.open(map, marker);

          lat.value = place.geometry.location.lat();
          lng.value = place.geometry.location.lng();

        });
      }
    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCo7f3fi5ithqwdTYl12WrGjMS-WMIsko8&libraries=places&callback=initMap"
        async defer></script>
@endsection
