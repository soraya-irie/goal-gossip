document.addEventListener('turbo:load', initMap);
document.addEventListener('turbo:render', initMap);

let map, geocoder;

function initMap() {
  const mapElement = document.getElementById('map');
  map = new google.maps.Map(mapElement, {
    zoom: 18,
    mapTypeId: 'satellite',
  });
  geocoder = new google.maps.Geocoder();
  clickSearchButton();

  if (document.getElementById('post_stadium_name').value) {
    geocoder.geocode({ address: document.getElementById('post_stadium_name').value }, (results, status) => {
      if (status === 'OK' && results[0]) {
        const location = results[0].geometry.location;
        map.setCenter(location);
      } else {
        alert(`該当する結果がありませんでした：${status}`);
      }
    });
  }
}

function clickSearchButton() {
  const searchButton = document.querySelector('.search-form-button');
  searchButton.addEventListener('click', () => codeAddress());
}

function codeAddress() {
  const address = document.getElementById('address').value;
  geocoder.geocode({ address }, (results, status) => {
    if (status === 'OK' && results[0]) {
      const location = results[0].geometry.location;
      map.setCenter(location);
      document.getElementById('post_stadium_name').value = address;
      document.getElementById('post_address').value = results[0].formatted_address;
    } else {
      alert(`該当する結果がありませんでした：${status}`);
    }
  });
}
