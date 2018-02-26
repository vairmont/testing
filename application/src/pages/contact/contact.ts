import { Component } from '@angular/core';
import {AlertController, IonicPage, LoadingController, NavController, NavParams} from 'ionic-angular';
import { Storage } from '@ionic/storage/es2015/storage';
import {TicketServiceProvider} from "../../providers/ticket-service/ticket-service";

@IonicPage()
@Component({
  selector: 'page-contact',
  templateUrl: 'contact.html',
})
export class ContactPage {
  ticketdata = {};
  departments: Array<any> = [
    {
      id: 1,
      name: 'Customer Service'
    },
    {
      id: 2,
      name: 'Technical'
    },
    {
      id: 3,
      name: 'Others'
    },
  ];

  constructor(public navCtrl: NavController, public navParams: NavParams,public storage: Storage,public loadingCtrl:LoadingController,public  alertCtrl : AlertController,public ticketService: TicketServiceProvider) {
  }

  ionViewDidLoad() {

  }
  sendTicket(){
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu...",
    });
    loader.present();
    this.storage.get("api_key").then(api_key => {
      this.storage.get("user_id").then(user_id => {
        let items = {
          user_id: user_id,
          department: this.ticketdata["department"],
          subject: this.ticketdata["subject"],
          message: this.ticketdata["message"]
        };

        let data = {
          items: items,
          api_key: api_key
        };
        console.log(data);
        this.ticketService.addTicket(data)
          .subscribe(result => {
            loader.dismiss();
            if(result.message == "OK") {
              this.ticketdata['department'] = "";
              this.ticketdata['subject'] = "";
              this.ticketdata['message'] = "";
              this.presentAlert("Terima kasih telah menghubungi kami. Kami akan segera memproses pesan Anda.");
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
