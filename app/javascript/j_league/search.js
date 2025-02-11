document.addEventListener('turbo:load', initMap);

const regions = {
  '北海道': ['北海道'],
  '東北': ['青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県'],
  '関東': ['茨城県', '栃木県', '群馬県', '埼玉県', '千葉県', '東京都', '神奈川県'],
  '中部': ['新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県', '岐阜県', '静岡県', '愛知県'],
  '近畿': ['三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県'],
  '中国': ['鳥取県', '島根県', '岡山県', '広島県', '山口県'],
  '四国': ['徳島県', '香川県', '愛媛県', '高知県'],
  '九州・沖縄': ['福岡県', '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県', '鹿児島県', '沖縄県']
};

let map;
let markers = [];

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  map = new Map(document.getElementById('map'), {
    center: { lat: 35.6895, lng: 139.6917 },
    zoom: 6,
    mapId: '<%= ENV["GOOGLE_MAPS_MAP_ID"] %>',
  });

  document.querySelectorAll('.region-button').forEach(button => {
    button.addEventListener('click', () => {
      showPrefectures(button.textContent);
    });
  });
}

function showPrefectures(region) {
  const prefectureButtons = document.getElementById('prefecture-buttons');
  prefectureButtons.innerHTML = '';
  regions[region].forEach(prefecture => {
    const prefectureButton = document.createElement('button');
    prefectureButton.textContent = prefecture;
    prefectureButton.className = 'prefecture-button';
    prefectureButton.onclick = () => searchStadiums(prefecture);
    prefectureButtons.appendChild(prefectureButton);
  });
}

async function searchStadiums(prefecture) {
  const { Geocoder } = await google.maps.importLibrary("geocoding");
  const geocoder = new Geocoder();
  geocoder.geocode({ address: prefecture }, async (results, status) => {
    if (status === 'OK') {
      map.setCenter(results[0].geometry.location);
      map.setZoom(9);

      const request = {
        location: results[0].geometry.location,
        keyword: `${prefecture} サッカースタジアム`,
        radius: 50000,
      };
      const { PlacesService } = await google.maps.importLibrary("places");
      const service = new PlacesService(map);
      service.nearbySearch(request, (results, status) => {
        const count = document.querySelector('.stadium-list-count');
        count.textContent = `${results.length}件を表示中`;
        const listItems = document.querySelector('.stadium-list-items');
        listItems.innerHTML = '';

        if (status === google.maps.places.PlacesServiceStatus.OK) {
          results.forEach(result => {
            createMarker(result);
            listItems.innerHTML += `<li class="list-group-item">
            <div><a href="https://www.google.com/maps/search/?api=1&query=${result.name}" target="_blank">${result.name}</a></div>
            <div>${result.vicinity}</div>
            </li>`;
          });
        }
      });
    }
  });
}

async function createMarker(place) {
  markers.forEach(marker => marker.setMap(null));
  markers = [];

  const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
  const marker = new AdvancedMarkerElement({
    map: map,
    position: place.geometry.location,
    title: place.name
  });

  const infoWindow = new google.maps.InfoWindow({
    content: `<h3>${place.name}</h3><p>${place.vicinity}</p><a href="https://www.google.com/maps/search/?api=1&query=${place.name}" target="_blank">Google Mapsで見る</a>`
  });

  marker.addListener('click', () => {
    infoWindow.open({
      anchor: marker,
      map: map,
      shouldFocus: true,
    });
  });

  markers.push(marker);
}
