function initMap() {
  var farm = window.farm;
  var markets = window.markets;
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 6,
    center: farm
  });
  var marker = new google.maps.Marker({
    position: farm,
    map: map
  });

  markets.forEach(function(market) {
    new google.maps.Marker({
      position: (({lat, lng}) => ({lat, lng}))(market),
      map: map
    });
  });
}