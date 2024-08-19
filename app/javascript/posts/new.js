document.addEventListener('turbo:load', initialize);
document.addEventListener('turbo:render', initialize);

function initialize() {
  const mapElement = document.getElementById('map');
  const searchButton = document.querySelector('.search-form-button');
  const nameDis = document.getElementById('post_stadium_name');
  const addressDis = document.getElementById('post_address');
  const addressInput = document.getElementById('address');
  let map, geocoder;

  function initMap() {
    const nationalStadium = { lat: 35.677824, lng: 139.714541 };
    map = new google.maps.Map(mapElement, {
      center: nationalStadium,
      zoom: 18,
      mapTypeId: 'satellite',
    });
    geocoder = new google.maps.Geocoder();
  }

  function codeAddress() {
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

  function addEventListeners() {
    searchButton.addEventListener('click', codeAddress);
  }

  initMap();
  addEventListeners();
}
