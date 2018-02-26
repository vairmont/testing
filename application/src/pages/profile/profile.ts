import { Component } from '@angular/core';
import {AlertController, IonicPage, LoadingController, NavController, NavParams} from 'ionic-angular';
import { ChangePasswordPage } from '../change-password/change-password';
import { ModalController } from 'ionic-angular/components/modal/modal-controller';
import { PlaceSearchPage } from '../place-search/place-search';
import { ProfileServiceProvider } from "../../providers/profile-service/profile-service";
import { Storage } from '@ionic/storage/es2015/storage';
import { CitiesServiceProvider } from '../../providers/cities-service/cities-service';
import { MapsAPILoader } from '@agm/core/services/maps-api-loader/maps-api-loader';
import { NgZone } from '@angular/core';
import { NativeGeocoder, NativeGeocoderReverseResult } from '@ionic-native/native-geocoder';

@IonicPage()
@Component({
  selector: 'page-profile',
  templateUrl: 'profile.html',
})
export class ProfilePage {
  user = {};
  cities:any;

  constructor(public navCtrl: NavController, 
    public navParams: NavParams, 
    public modalCtrl: ModalController, 
    public storage: Storage, 
    public profileService : ProfileServiceProvider,
    public loadingCtrl:LoadingController,
    public alertCtrl : AlertController,
    public cityService: CitiesServiceProvider,
    public mapsAPILoader: MapsAPILoader,
    public ngZone: NgZone,
    public nativeGeocoder: NativeGeocoder) {
  }

  ionViewDidLoad() {
    this.loadProfile();
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

  loadProfile(){
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
                  user_id : user_id,
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

  updateProfile() {
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu...",
    });
    loader.present();

    this.storage.get("api_key").then(api_key => {
      this.storage.get("user_id").then(user_id => {
      
      let data = {
        items: this.user,
        api_key: api_key
      };

      this.profileService.updateProfile(data)
        .subscribe(result => {
          loader.dismiss();
          if(result.message == "OK") {
            this.presentAlert("Update profil berhasil.");
          }
          else {
            this.presentAlert(result.message[0]);
          }
        });
      });
    });
  }

  changePassword() {
    this.navCtrl.push(ChangePasswordPage);
  }

  placeSearch() {
      let modal = this.modalCtrl.create(PlaceSearchPage);

      modal.onDidDismiss(data => {
        this.mapsAPILoader.load().then(() => {
          this.ngZone.run(() => {
            this.user["address_1"] = data.geocodeAddress;
            if(this.user["lat"] == "") {
              this.user["lat"] = 0;
            }
            else {
              this.user["lat"] = data.lat;
            }

            if(this.user["lng"] == "") {
              this.user["lng"] = 0;
            }
            else {
              this.user["lng"] = data.lng;
            }
          });
        });
      });
      modal.present();
  }

  presentAlert(message) {
    let alert = this.alertCtrl.create({
      title: '',
      subTitle: message,
      buttons: ['OK']
    });
    alert.present();
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
