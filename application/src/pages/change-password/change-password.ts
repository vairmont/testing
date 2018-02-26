import { Component } from '@angular/core';
import { AlertController, IonicPage, LoadingController, NavController, NavParams } from 'ionic-angular';
import { ProfileServiceProvider } from "../../providers/profile-service/profile-service";
import { Storage } from '@ionic/storage/es2015/storage';
import { LoginPage } from "../login/login";
import { LoginServiceProvider } from '../../providers/login-service/login-service';

@IonicPage()
@Component({
  selector: 'page-change-password',
  templateUrl: 'change-password.html',
})
export class ChangePasswordPage {
  user = {};

  constructor(public navCtrl: NavController,
    public navParams: NavParams,
    public storage: Storage,
    public profileService: ProfileServiceProvider,
    public loadingCtrl:LoadingController,
    public alertCtrl: AlertController,
    public loginService: LoginServiceProvider) {
  }

  ionViewDidLoad() {
  }

  updatePassword() {
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu...",
    });
    loader.present();

    this.storage.get("api_key").then(api_key => {
      this.storage.get("user_id").then(user_id => {

        let items = {
          user_id: user_id,
          old_password: this.user["old_password"],
          password: this.user["password"],
          confirm_password: this.user["confirm_password"]
        };

        let data = {
          items: items,
          api_key: api_key
        };

        this.profileService.changePassword(data)
          .subscribe(result => {
            loader.dismiss();
            if(result.message == "OK") {
              this.storage.get('fcm_token').then(token => {
                let data = { fcm_token: token };
                this.loginService.logout(data).subscribe(result => { console.log(result) });
                this.storage.clear();
                this.presentAlert("Ubah password berhasil. Silahkan login kembali.");
                this.navCtrl.parent.parent.setRoot(LoginPage);
              });
            }
            else {
              this.presentAlert(result.message[0]);
            }
          });
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
}
