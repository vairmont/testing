import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { OrderConfirmationPage } from '../order-confirmation/order-confirmation';
import { PlaceSearchPage } from '../place-search/place-search';
import { ModalController } from 'ionic-angular/components/modal/modal-controller';
import { Storage } from '@ionic/storage/es2015/storage';
import { ProfileServiceProvider } from '../../providers/profile-service/profile-service';
import { CitiesServiceProvider } from '../../providers/cities-service/cities-service';
import { NgZone } from '@angular/core';
import { NativeGeocoder, NativeGeocoderReverseResult } from '@ionic-native/native-geocoder';

@IonicPage()
@Component({
  selector: 'page-customer-detail',
  templateUrl: 'customer-detail.html',
})
export class CustomerDetailPage {
  user = {};
  cities: any;

  constructor(public navCtrl: NavController, 
    public navParams: NavParams, 
    public modalCtrl: ModalController, 
    public storage: Storage, 
    public profileService: ProfileServiceProvider, 
    public cityService: CitiesServiceProvider,
    public ngZone: NgZone,
    public nativeGeocoder: NativeGeocoder) {
  }

  ionViewDidLoad() {
    this.getProfile();
    this.getCities();
  }

  getCities() {
    this.cityService.getCities()
    .subscribe(result => {
      if(result.message == 'OK') {
        this.cities = result.data;
      }
    });
  }

  getProfile() {
    this.storage.get("api_key").then(api_key => {
      this.storage.get("user_id").then(user_id => {

        let item = {
          user_id : user_id
        };

        let data = {
          items : item,
          api_key : api_key
        };

        this.profileService.getProfile(data)
          .subscribe(result => {
            this.user = {
              name: result.data.name,
              email: result.data.email,
              phone: result.data.phone,
              address_1 : result.data.map_address,
              address_2 : result.data.detail_address,
              lat : +result.data.lat,
              lng : +result.data.lng,
              city_id : result.data.city_id,
              city_name : result.data.city_name
            };
          });
      });
    });
  }

  orderConfirmation() {
    this.navCtrl.push(OrderConfirmationPage, { user: this.user });
  }

  placeSearch() {
    let modal = this.modalCtrl.create(PlaceSearchPage);

    modal.onDidDismiss(data => {
      this.user['address_1'] = data.geocodeAddress;
      if(data.lat == "") {
        this.user['lat'] = 0;
      }
      else {
        this.user['lat'] = data.lat;
      }

      if(data.lng == "") {
        this.user['lng'] = 0;
      }
      else {
        this.user['lng'] = data.lng;
      }
    });

    modal.present();
  }

  geocode(lat: any, lng: any) {
    return this.nativeGeocoder.reverseGeocode(lat,lng)
      .then(
        (result: NativeGeocoderReverseResult) => {
          this.user['address_1'] = result.thoroughfare + "," + result.locality + "," + result.subAdministrativeArea;
      })
      .catch(
        (error: any) => {
          console.log(error);
        }
      );
  }

  markerMoved(e) { 
    this.ngZone.run(() => {
      this.user['lat'] = e.coords.lat;
      this.user['lng'] = e.coords.lng;
      this.geocode(e.coords.lat, e.coords.lng);
    });
  }

}
