import { Component } from '@angular/core';
import { NavController, NavParams, AlertController } from 'ionic-angular';
import { LoginPage } from "../login/login";
import { ProfilePage } from "../profile/profile";
import { TermsPage } from "../terms/terms";
import { PrivacyPage } from "../privacy/privacy";
import { FavoritePage } from '../favorite/favorite';
import { BrotherAppPage } from '../brother-app/brother-app';
import { ContactPage } from '../contact/contact';
import { Storage } from '@ionic/storage/es2015/storage';
import { LoginServiceProvider } from '../../providers/login-service/login-service';

@Component({
  selector: 'page-settings',
  templateUrl: 'settings.html',
})
export class SettingsPage {
  constructor(public navCtrl: NavController, public navParams: NavParams, public alertCtrl: AlertController, public storage: Storage, public loginService: LoginServiceProvider) {
  }

  ionViewDidLoad() {

  }

  signOut() {
    this.showConfirmLogout();
  }
  goProfile() {
    this.navCtrl.push(ProfilePage);
  }
  goFavorite() {
    this.navCtrl.push(FavoritePage);
  }
  goTerms() {
    this.navCtrl.push(TermsPage);
  }
  goPrivacy() {
    this.navCtrl.push(PrivacyPage);
  }
  goBrotherApps() {
    this.navCtrl.push(BrotherAppPage);
  }
  goContact() {
    this.navCtrl.push(ContactPage);
  }

  showConfirmLogout() {
    let confirm = this.alertCtrl.create({
      title: 'Logout',
      message: 'Apakah Anda yakin ingin keluar?',
      buttons: [
        {
          text: 'Tidak',
          handler: () => {

          }
        },
        {
          text: 'Ya',
          handler: () => {
            this.storage.get('fcm_token').then(token => {
              let data = { fcm_token: token };
              this.loginService.logout(data).subscribe(result => { console.log(result) });
              this.storage.clear();
              this.navCtrl.parent.parent.setRoot(LoginPage);
            });
          }
        }
      ]
    });
    confirm.present();
  }
}
