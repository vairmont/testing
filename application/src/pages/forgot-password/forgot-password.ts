import { Component } from '@angular/core';
import { IonicPage, NavController } from 'ionic-angular';
import { ForgotPasswordServiceProvider } from '../../providers/forgot-password-service/forgot-password-service';
import { AlertController } from 'ionic-angular/components/alert/alert-controller';
import { LoadingController } from 'ionic-angular/components/loading/loading-controller';

@IonicPage()
@Component({
  selector: 'page-forgot-password',
  templateUrl: 'forgot-password.html',
})
export class ForgotPasswordPage {
  // declare form input
  data = {};

  constructor(
    public navCtrl: NavController, 
    public alertCtrl: AlertController, 
    public forgotPasswordService: ForgotPasswordServiceProvider,
    public loadingCtrl: LoadingController) {
  }

  ionViewDidLoad() {
  }

  presentAlert(message) {
    let alert = this.alertCtrl.create({
      title: '',
      subTitle: message,
      buttons: ['OK']
    });
    alert.present();
  }

  submit() {
    let loader = this.loadingCtrl.create({
      content: 'Mohon menunggu...'
    });

    loader.present();
    
    this.forgotPasswordService.forgotPassword(this.data)
    .subscribe(result => {
      loader.dismiss();
      if(result.message == 'OK') {
        let text = 'Password baru telah dikirimkan ke e-mail Anda. Terima kasih.';
        this.presentAlert(text);
      }
      else {
        this.presentAlert(result.message);
      }
    });
  }
}
