import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { Storage } from '@ionic/storage/es2015/storage';
import { VerifyServiceProvider } from '../../providers/verify-service/verify-service';
import { LoadingController } from 'ionic-angular/components/loading/loading-controller';
import { AlertController } from 'ionic-angular/components/alert/alert-controller';
import { LoginPage } from '../login/login';

@IonicPage()
@Component({
  selector: 'page-verify-code',
  templateUrl: 'verify-code.html',
})
export class VerifyCodePage {
  data = {};
  registration_id: any;
  hash_code: any;

  constructor(public navCtrl: NavController, public loadingCtrl: LoadingController, public alertCtrl: AlertController, public navParams: NavParams, public storage: Storage, public verifyService: VerifyServiceProvider) {
  }

  ionViewWillEnter() {
    this.request();
    this.storage.get('registration_id').then(registrationid => { return this.registration_id = registrationid; });
  }

  ionViewDidLoad() {
  }

  request() {
    this.storage.get('phone').then(phone => {
      let item = {
        "phone" : phone
      };
  
      this.verifyService.verifyRequest(item)
      .subscribe(result => {
        if(result.message == 'OK') {
          this.hash_code = result.data.hash_code;
        }
        else {
          this.presentAlert(result.message);
        }
      });
     });
  }

  presentAlert(message) {
    let alert = this.alertCtrl.create({
      title: '',
      subTitle: message,
      buttons: ['OK']
    });
    alert.present();
  }

  verify() {
    let loader = this.loadingCtrl.create({
      content: 'Mohon menunggu...'
    });

    loader.present();

    let check = {
      "code" : this.data['code'],
      "hash_code" : this.hash_code,
      "registration_id": this.registration_id
    };
    
    this.verifyService.verifyCheck(check)
    .subscribe(result => {
      loader.dismiss();
      if(result.message == 'OK') {
        let text = "Registrasi berhasil. Silahkan masuk dengan akun Anda.";
        this.presentAlert(text);

        this.storage.clear();
        this.navCtrl.setRoot(LoginPage);
      }
      else {
        this.presentAlert(result.message);
      }
    });
  }
}