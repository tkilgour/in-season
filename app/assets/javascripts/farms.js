function initMap() {
  var farm = window.farm;
  var markets = window.markets;
  var map = new google.maps.Map(document.getElementById('map'), {
    disableDefaultUI: true
  });

  var marker = new google.maps.Marker({
    position: farm,
    icon: '/assets/farm-2.png',
    map: map,
    zIndex: 2
  });

  var latLngList = [marker];
  var prevInfoWindow = false;

  markets.forEach(function(market) {
    var m = new google.maps.Marker({
      position: (({lat, lng}) => ({lat, lng}))(market),
      map: map,
      zIndex: 1
    });

    var infoWindow = new google.maps.InfoWindow({
      content: `<strong>${market.name}</strong><br>${market.address}`
    });

    m.addListener('click', function() {
      if (prevInfoWindow) {
        prevInfoWindow.close();
      }
      infoWindow.open(map, m);
      prevInfoWindow = infoWindow;
    });

    latLngList.push(m);
  });

  var bounds = new google.maps.LatLngBounds();
  for (var i = 0; i < latLngList.length; i++) {
    bounds.extend(latLngList[i].getPosition());
  }

  map.fitBounds(bounds);
}

$(document).on('turbolinks:load', function() {
  $('#market_name').bind('railsAutocomplete.select', (event, data) => {
    $('#market_address').attr('value', data.item.parsed_address);
  });
});