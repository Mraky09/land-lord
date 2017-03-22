$(document).on('turbolinks:load', function() {
  var _latitude = 21.036237;
  var _longitude = 105.790583;

  google.maps.event.addDomListener(window, 'load', initSubmitMap(_latitude,_longitude));
  function initSubmitMap(_latitude,_longitude){
    var mapCenter = new google.maps.LatLng(_latitude,_longitude);
    var mapOptions = {
      zoom: 15,
      center: mapCenter,
      disableDefaultUI: false,
      //scrollwheel: false,
      styles: mapStyles
    };
    var mapElement = document.getElementById('submit-map');
    var map = new google.maps.Map(mapElement, mapOptions);
    var marker = new MarkerWithLabel({
      position: mapCenter,
      map: map,
      // icon: 'assets/img/marker.png',
      labelAnchor: new google.maps.Point(50, 0),
      draggable: true
    });
    $('#submit-map').removeClass('fade-map');
    google.maps.event.addListener(marker, "mouseup", function (event) {
      var latitude = this.position.lat();
      var longitude = this.position.lng();
      $('#latitude').val( this.position.lat() );
      $('#longitude').val( this.position.lng() );
    });

  //      Autocomplete
    var input = /** @type {HTMLInputElement} */( document.getElementById('house_address') );
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.bindTo('bounds', map);
    google.maps.event.addListener(autocomplete, 'place_changed', function() {
      var place = autocomplete.getPlace();
      if (!place.geometry) {
        return;
      }
      if (place.geometry.viewport) {
        map.fitBounds(place.geometry.viewport);
      } else {
        map.setCenter(place.geometry.location);
        map.setZoom(17);
      }
      marker.setPosition(place.geometry.location);
      marker.setVisible(true);
      $('#latitude').val( marker.getPosition().lat() );
      $('#longitude').val( marker.getPosition().lng() );
      var address = '';
      if (place.address_components) {
        address = [
          (place.address_components[0] && place.address_components[0].short_name || ''),
          (place.address_components[1] && place.address_components[1].short_name || ''),
          (place.address_components[2] && place.address_components[2].short_name || '')
        ].join(' ');
      }
    });
  }

  function success(position) {
    initSubmitMap(position.coords.latitude, position.coords.longitude);
    $('#latitude').val( position.coords.latitude );
    $('#longitude').val( position.coords.longitude );
  }

  $('.geo-location').on("click", function() {
    if (navigator.geolocation) {
      $('#submit-map').addClass('fade-map');
      navigator.geolocation.getCurrentPosition(success);
    } else {
      error('Geo Location is not supported');
    }
  });
});
