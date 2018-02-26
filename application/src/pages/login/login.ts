import { Component } from '@angular/core';
import {AlertController, IonicPage, LoadingController, NavController, NavParams} from 'ionic-angular';
import { TabsPage } from "../tabs/tabs";
import { RegisterPage}  from "../register/register";
import { ForgotPasswordPage } from '../forgot-password/forgot-password';
import {LoginServiceProvider} from "../../providers/login-service/login-service";
import { Storage } from '@ionic/storage/es2015/storage';

@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {
  login = {};

  constructor(public loadingCtrl:LoadingController,public navCtrl: NavController, public navParams: NavParams, public loginService: LoginServiceProvider, public  alertCtrl: AlertController, public storage: Storage) {
  }

  ionViewDidLoad() {
    this.isAuthenticated();
  }

  isAuthenticated() {
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu...",
    });
    loader.present();

    this.storage.get('user_id').then(userid => {
      loader.dismiss();
      if(userid != null) {
        this.navCtrl.setRoot(TabsPage);
      }
    });
  }

  doLogin() {
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu...",
    });
    loader.present();

    this.loginService.login(this.login)
    .subscribe(result => {
      loader.dismiss();
      if(result.message == "OK"){
        this.storage.set('user_id',result.data.user_id);
        this.storage.set('role_id',result.data.role_id);
        this.storage.set('api_key',result.data.api_key);
        this.storage.set('email', result.data.email);
        this.storage.set('role_name', result.data.role_name);
        this.navCtrl.setRoot(TabsPage);
      }
      else{
        this.presentAlert(result.message[0]);
      }
    });
  }

  doSignUp() {
    this.navCtrl.push(RegisterPage);
  }

  resetPassword() {
    this.navCtrl.push(ForgotPasswordPage);
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
