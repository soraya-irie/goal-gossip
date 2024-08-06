document.addEventListener('turbo:load', () => {
  function initMap() {
    const address = document.getElementById('post_address').value;
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ address }, (results, status) => {
      if (status === 'OK' && results[0]) {
        const location = results[0].geometry.location;
        const mapOptions = {
          center: location,
          zoom: 14,
        };

        const mapElement = document.getElementById('map');
        const map = new google.maps.Map(mapElement, mapOptions);
        new google.maps.Marker({ position: location, map });
      } else {
        console.error(`ジオコーディングが次の理由で失敗しました: ${status}`);
      }
    });
  }

  initMap();
});
