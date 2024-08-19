document.addEventListener('turbo:load', initMap);
document.addEventListener('turbo:render', initMap);

let map, geocoder;

function initMap() {
  const mapElement = document.getElementById('map');
  const searchButton = document.querySelector('.search-form-button');
  const nameDis = document.getElementById('post_stadium_name');
  const addressDis = document.getElementById('post_address');
  const addressInput = document.getElementById('address');

  const nationalStadium = { lat: 35.677824, lng: 139.714541 };
  map = new google.maps.Map(mapElement, {
    center: nationalStadium,
    zoom: 18,
    mapTypeId: 'satellite',
  });
  geocoder = new google.maps.Geocoder();

  addEventListeners(searchButton, addressInput, nameDis, addressDis);
}

function codeAddress(addressInput, nameDis, addressDis) {
  const address = addressInput.value;
  geocoder.geocode({ address }, (results, status) => {
    if (status === 'OK' && results[0]) {
      const location = results[0].geometry.location;
      map.setCenter(location);
      nameDis.value = address;
      addressDis.value = results[0].formatted_address;
    } else {
      alert(`該当する結果がありませんでした：${status}`);
    }
  });
}

function addEventListeners(searchButton, addressInput, nameDis, addressDis) {
  searchButton.addEventListener('click', () => codeAddress(addressInput, nameDis, addressDis));
}
