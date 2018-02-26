import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { ViewController } from 'ionic-angular/navigation/view-controller';
import { Geolocation } from '@ionic-native/geolocation';
import { NativeGeocoder, NativeGeocoderReverseResult, NativeGeocoderForwardResult } from '@ionic-native/native-geocoder';
import { LoadingController } from 'ionic-angular/components/loading/loading-controller';
import { NgZone } from '@angular/core';
import { MapsAPILoader } from '@agm/core';

@IonicPage()
@Component({
  selector: 'page-place-search',
  templateUrl: 'place-search.html',
})
export class PlaceSearchPage {
  lat: number;
  lng: number;
  geocodeAddress: string;
  autocompleteItems: any;
  acService:any;

  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    public viewCtrl: ViewController,
    public geolocation: Geolocation,
    public nativeGeocoder: NativeGeocoder,
    public loadingCtrl: LoadingController,
    public mapsAPILoader: MapsAPILoader,
    public ngZone: NgZone
  ) {
  }

  ionViewDidLoad() {
    this.locateMe();
    this.acService = new google.maps.places.AutocompleteService();
    this.autocompleteItems = [];
    this.geocodeAddress = "";
    this.lat = 0;
    this.lng = 0;
  }

  updateSearch() {
    if (this.geocodeAddress == '') {
      this.autocompleteItems = [];
      return;
    }
    let self = this;
    let config = {
      // types:  ['geocode'], // other types available in the API: 'establishment', 'regions', and 'cities'
      input: this.geocodeAddress,
      componentRestrictions: { country: 'ID' }
    }
    this.acService.getPlacePredictions(config, function (predictions, status) {
      self.autocompleteItems = [];
      predictions.forEach((prediction) => {
        self.autocompleteItems.push(prediction);
      });
    });
  }

  geocode(lat: any, lng: any) {
    return this.nativeGeocoder.reverseGeocode(lat,lng)
      .then(
        (result: NativeGeocoderReverseResult) => {
          this.geocodeAddress = result.thoroughfare + "," + result.locality + "," + result.subAdministrativeArea;
      })
      .catch(
        (error: any) => {
          console.log(error);
        }
      );
  }

  locateMe() {
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu..."
    });
    loader.present();

    this.geolocation.getCurrentPosition()
      .then((resp) => {
        // resp.coords.latitude
        // resp.coords.longitude
        loader.dismiss();
        this.lat = resp.coords.latitude;
        this.lng = resp.coords.longitude;
        this.geocode(resp.coords.latitude, resp.coords.longitude);
      })
      .catch((error) => {
       console.log('Error getting location', error);
     });
  }

  onDismiss() {
    let items = {
      "geocodeAddress" : this.geocodeAddress,
      "lat" : this.lat,
      "lng" : this.lng
    };
    this.viewCtrl.dismiss(items);
  }

  selectedItem(item: any) {
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu..."
    });
    loader.present();

    this.mapsAPILoader.load().then(() => {
      this.nativeGeocoder.forwardGeocode(item)
      .then((coordinates: NativeGeocoderForwardResult) => {
        loader.dismiss();
        this.ngZone.run(() => {
          this.lat = +coordinates.latitude;
          this.lng = +coordinates.longitude;
          this.geocodeAddress = item;
        });
      })
      .catch((error: any) => {
        console.log(error)
      });
    });
  }

  markerMoved(e) { 
    this.ngZone.run(() => {
      this.lat = e.coords.lat;
      this.lng = e.coords.lng;
      this.geocode(e.coords.lat, e.coords.lng);
    });
  }

}
