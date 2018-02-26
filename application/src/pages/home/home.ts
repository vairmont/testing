import { Component } from '@angular/core';
import {IonicPage, LoadingController, NavController, NavParams} from 'ionic-angular';
import {ProductPage} from "../product/product";
import { FCM } from '@ionic-native/fcm';
import { Device } from '@ionic-native/device';
import { Storage } from '@ionic/storage/es2015/storage';
import { FcmServiceProvider } from '../../providers/fcm-service/fcm-service';
import { NewsServiceProvider } from '../../providers/news-service/news-service';
import { ApiUrlServiceProvider } from '../../providers/api-url-service/api-url-service';

@IonicPage()
@Component({
  selector: 'page-home',
  templateUrl: 'home.html',
})
export class HomePage {
  news: any;
  imgBaseUrl: any;
  constructor(public loadingCtrl:LoadingController,
    public navCtrl: NavController,
    public navParams: NavParams,
    public fcm: FCM,
    public device: Device,
    public storage: Storage,
    public fcmService: FcmServiceProvider,
    public newsService: NewsServiceProvider,
    public url: ApiUrlServiceProvider) {

  }

  ionViewDidLoad() {
    this.getFCMToken();
    this.getNewsPromo();
    this.imgBaseUrl = this.url.IMG_URL;
  }

  registerToken(fcmToken) {
    this.storage.get('user_id').then(userid => {
      this.storage.get('role_id').then(roleid => {
        this.storage.get('api_key').then(apikey => {

          let data = {
            "user_id": userid,
            "role_id": roleid,
            "fcm_token": fcmToken,
            "device_platform": this.device.platform,
            "uuid": this.device.uuid
          };

          let item = {
            items: data,
            api_key: apikey
          };

          this.fcmService.addToken(item)
          .subscribe(result => {
            console.log(result)
          });

        });
      });
    });
  }

  verifyToken(fcmToken) {
    this.storage.get('api_key').then(apikey => {

      let data = {
        "fcm_token": fcmToken,
      };

      let item = {
        items: data,
        api_key: apikey
      };

      this.fcmService.checkToken(item)
      .subscribe(result => {
        if(result == 'ZERO_RESULT') {
          this.fcm.onTokenRefresh().subscribe(token => {
            this.storage.set('fcm_token', token);
            this.registerToken(token);
          });
        }
      });

    });
  }

  getFCMToken() {
    this.storage.get('fcm_token').then(fcmToken => {
      if(fcmToken == null) {
        // if null request token then push to server
        this.fcm.getToken().then(token => {
          this.storage.set('fcm_token', token);
          this.registerToken(token);
        });
      }
      else {
        // if !null check token
        this.verifyToken(fcmToken);
      }
    });
  }

  getNewsPromo() {
    this.storage.get('role_id').then(role_id => {
      this.storage.get('api_key').then(api_key => {

        let data = {
          items: {
            role_id: role_id
          },
          api_key: api_key
        };

        this.newsService.getPromo(data)
        .subscribe(result => {
          this.news = result.data;
        });

      });
    });
  }

  doProducts(id) {
    this.navCtrl.push(ProductPage,{id: id});
  }
}
