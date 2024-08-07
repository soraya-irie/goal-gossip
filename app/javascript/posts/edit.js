document.addEventListener('turbo:load', () => {
  function initMap() {
    const nationalStadium = { lat: 35.677824, lng: 139.714541 };
    map = new google.maps.Map(mapElement, {
      center: nationalStadium,
      zoom: 14,
    });
  }
  initMap();
});
