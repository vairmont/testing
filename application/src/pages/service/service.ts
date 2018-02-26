import { Component } from '@angular/core';
import {AlertController, LoadingController, NavController, NavParams} from 'ionic-angular';
import { TermsPage } from '../terms/terms';
import { WarrantyPage } from '../warranty/warranty';
import {ServiceServiceProvider} from "../../providers/service-service/service-service";
import { Storage } from '@ionic/storage/es2015/storage';
import {CitiesServiceProvider} from "../../providers/cities-service/cities-service";

@Component({
  selector: 'page-service',
  templateUrl: 'service.html',
})
export class ServicePage {
  servicedata : any;
  cities : any;
  constructor(public navCtrl: NavController, public navParams: NavParams,public storage: Storage,public loadingCtrl:LoadingController,public  alertCtrl : AlertController,public serviceSrvc:ServiceServiceProvider,public citiesService: CitiesServiceProvider,) {
  }

  ionViewDidLoad() {
    this.getServices();
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

  searchbycity(city_id) {
    if(city_id == "")
    {
      this.getServices();
    }
    else{
      this.getServicesByArea(city_id);
    }
  }

  getServicesByArea(city_id){
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu...",
    });
    loader.present();
    this.storage.get("api_key").then(api_key => {

      let data = {
        items: {
          city_id : city_id
        },
        api_key: api_key
      };
      this.serviceSrvc.getServicebyArea(data)
        .subscribe(result => {
          loader.dismiss();
          if(result.message == "OK") {
            this.servicedata = result.data;
          }
          else {
          }
        });
    });
  }
  getServices(){
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu...",
    });
    loader.present();
    this.storage.get("api_key").then(api_key => {
        let data = {
          api_key: api_key
        };
        this.serviceSrvc.getService(data)
          .subscribe(result => {
            loader.dismiss();
            if(result.message == "OK") {
              this.servicedata = result.data;
            }
            else {
            }
          });
      });
  }
  showWarrantyPage(){
    this.navCtrl.push(WarrantyPage);
  }

  terms() {
    this.navCtrl.push(TermsPage);
  }

  presentAlert(message) {
    let alert = this.alertCtrl.create({
      title: '',
      subTitle: message,
      buttons: ['OK']
    });
    alert.present();
  }
}
