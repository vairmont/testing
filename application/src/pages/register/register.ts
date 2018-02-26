import { Component } from '@angular/core';
import {IonicPage, NavController, NavParams} from 'ionic-angular';
import { Camera, CameraOptions } from '@ionic-native/camera';
import { LoadingController } from 'ionic-angular/components/loading/loading-controller';
import { VerifyCodePage } from '../verify-code/verify-code';
import { PlaceSearchPage } from '../place-search/place-search';
import { ModalController } from 'ionic-angular/components/modal/modal-controller';
import 'rxjs';
import { CitiesServiceProvider } from '../../providers/cities-service/cities-service';
import { RegisterServiceProvider } from '../../providers/register-service/register-service';
import { AlertController } from 'ionic-angular/components/alert/alert-controller';
import { Storage } from '@ionic/storage/es2015/storage';
import { NgZone } from '@angular/core';
import { NativeGeocoder, NativeGeocoderReverseResult } from '@ionic-native/native-geocoder';
import { FileTransferObject, FileTransfer, FileUploadOptions } from '@ionic-native/file-transfer';
import { ApiUrlServiceProvider } from '../../providers/api-url-service/api-url-service';


@IonicPage()
@Component({
  selector: 'page-register',
  templateUrl: 'register.html',
})

export class RegisterPage {
  // set default tabs onInit
  registerAs: string = "customer";
  storePhoto: any;
  geocodeAddress: string;
  lat: number;
  lng: number;
  productCategories: any;
  cities: any;
  customer = {};
  reseller = {};

  options: CameraOptions = {
    quality: 50,
    destinationType: this.camera.DestinationType.DATA_URL,
    encodingType: this.camera.EncodingType.JPEG,
    mediaType: this.camera.MediaType.PICTURE,
    correctOrientation: true
  };

  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    public camera: Camera,
    public loadingCtrl: LoadingController,
    public alertCtrl: AlertController,
    public modalCtrl: ModalController,
    public citiesService: CitiesServiceProvider,
    public registerService: RegisterServiceProvider,
    public storage: Storage,
    public ngZone: NgZone,
    public nativeGeocoder: NativeGeocoder,
    public transfer: FileTransfer,
    public apiUrl: ApiUrlServiceProvider
  ) {
  }

  ionViewDidLoad() {
    this.getCities();
  }

  getCities() {
    this.citiesService.getCities()
      .subscribe(result => {
        if(result.message == 'OK') {
          this.cities = result.data;
        }
    });
  }

  presentLoading() {
    let loader = this.loadingCtrl.create({
      content: "Mohon Menunggu...",
      duration: 300
    });

    loader.present();
  }

  presentAlert(message) {
    let alert = this.alertCtrl.create({
      title: '',
      subTitle: message,
      buttons: ['OK']
    });
    alert.present();
  }

  takePicture() {
    this.camera.getPicture(this.options).then((imageData) => {
      // imageData is either a base64 encoded string or a file URI
      // If it's base64:
      this.storePhoto = 'data:image/jpeg;base64,' + imageData;
      this.presentLoading();
     }, (err) => {
      // Handle error
     });
  }

  placeSearch() {
    let modal = this.modalCtrl.create(PlaceSearchPage);

    modal.onDidDismiss(data => {
      this.geocodeAddress = data.geocodeAddress;
      if(data.lat == "") {
        this.lat = 0;
      }
      else {
        this.lat = data.lat;
      }

      if(data.lng == "") {
        this.lng = 0;
      }
      else {
        this.lng = data.lng;
      }
    });

    modal.present();
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

  markerMoved(e) { 
    this.ngZone.run(() => {
      this.lat = e.coords.lat;
      this.lng = e.coords.lng;
      this.geocode(e.coords.lat, e.coords.lng);
    });
  }

  registerReseller() {
    let loader = this.loadingCtrl.create({
      content: 'Mohon menunggu...'
    });

    loader.present();

    this.storage.set('phone', this.reseller['phone']);

    let data = {
      store_name: this.reseller['store_name'],
      name: this.reseller['name'],
      phone: this.reseller['phone'],
      store_photo: "",
      city_id: this.reseller['city_id'],
      address_1: this.reseller['address_1'],
      lat: this.reseller['lat'],
      lng: this.reseller['lng'],
      address_2: this.reseller['address_2'],
      email: this.reseller['email'],
      password: this.reseller['password'],
      confirm_password: this.reseller['confirm_password'],
      printer_inkjet: this.reseller['printer_inkjet'] == true ? 1 : '',
      printer_laser: this.reseller['printer_laser'] == true ? 1 : '',
      printer_label: this.reseller['printer_label'] == true ? 1 : '',
      scanner: this.reseller['scanner'] == true ? 1 : '',
      mesin_jahit: this.reseller['mesin_jahit'] == true ? 1 : '',
      lain_lain: this.reseller['lain_lain'] == true ? 1 : ''
    };

    this.registerService.registerReseller(data)
    .subscribe(result => {
      loader.dismiss();
      if(result.message == 'OK') {
        // store registration_id to storage then redirect to verify code page
        this.storage.set('registration_id', result.data.registration_id);

        let uploadLoader = this.loadingCtrl.create({
          content: "Upload foto..."
        });
        uploadLoader.present();

        const fileTransfer: FileTransferObject = this.transfer.create();
        let options: FileUploadOptions = {
          fileKey: 'photo',
          fileName: 'photo',
          chunkedMode: false,
          mimeType: "image/jpeg",
          headers: {registration_id: result.data.registration_id}
        }
        let url = this.apiUrl.API_URL + '/v1/register/reseller/photo/upload';

        fileTransfer.upload(this.storePhoto, url, options)
        .then(result => {
          uploadLoader.dismiss();
          this.navCtrl.push(VerifyCodePage);
        }, (err) => {
          console.log(err);
        });
      }
      else {
        // display first error
        this.presentAlert(result.message[0]);
      }
    });
  }

  registerCustomer() {
    let loader = this.loadingCtrl.create({
      content: 'Mohon menunggu...'
    });

    loader.present();

    this.storage.set('phone', this.customer['phone']);

    this.registerService.registerCustomer(this.customer)
    .subscribe(result => {
      loader.dismiss();
      if(result.message == 'OK') {
        // store registration_id to storage then redirect to verify code page
        this.storage.set('registration_id', result.data.registration_id);
        this.navCtrl.push(VerifyCodePage);
      }
      else {
        // display first error
        this.presentAlert(result.message[0]);
      }
    });
  }

}
