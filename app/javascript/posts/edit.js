document.addEventListener('turbo:load', () => {
  function initMap() {
    const address = document.getElementById('post_stadium_name').value;
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ address }, (results, status) => {
      if (status === 'OK' && results[0]) {
        const location = results[0].geometry.location;
        const mapOptions = {
          center: location,
          zoom: 18,
          mapTypeId: 'satellite'
        };

        const mapElement = document.getElementById('map');
        new google.maps.Map(mapElement, mapOptions);
      } else {
        console.error(`ジオコーディングが次の理由で失敗しました: ${status}`);
      }
    });
  }

  initMap();
});
