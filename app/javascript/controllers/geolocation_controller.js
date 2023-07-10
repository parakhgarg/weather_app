import { Controller } from "@hotwired/stimulus"
import { Turbo } from '@hotwired/turbo-rails';

const options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0,
};

export default class extends Controller {
  success(pos) {
    const crd = pos.coords;
  
    console.log("Your current position is:");
    console.log(`Latitude : ${crd.latitude}`);
    console.log(`Longitude: ${crd.longitude}`);
    console.log(`More or less ${crd.accuracy} meters.`);
    // Turbo.visit("/weathers/abc")
    fetch("/weathers/weather_info?" + new URLSearchParams({latitude: crd.latitude, longitude: crd.longitude}))
      .then(response => response.text())
      .then((data) => {
        document.getElementById('weather-info').innerHTML = data
        //console.log(data)
      }
    )
  }
  
  error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  }
  
  connect() {
    if(document.getElementById('city').value == ''){
      navigator.geolocation.getCurrentPosition(this.success, this.error, options);
    }
  }
}
