import { Component, ViewChild } from '@angular/core';
import { IonicPage, NavController, NavParams, Content } from 'ionic-angular';
import { OrderServiceProvider } from '../../providers/order-service/order-service';
import { Storage } from '@ionic/storage/es2015/storage';
import { AlertController } from 'ionic-angular/components/alert/alert-controller';

@IonicPage()
@Component({
  selector: 'page-chat',
  templateUrl: 'chat.html',
})
export class ChatPage {
  @ViewChild(Content) content: Content;
  msgList: any;
  user_id: any;
  recipient_id: any;
  item = {};

  constructor(public navCtrl: NavController, public navParams: NavParams, public orderService: OrderServiceProvider, public storage: Storage, public alertCtrl: AlertController) {
    this.storage.get('user_id').then(user_id => {
      this.user_id = user_id;
    });

    this.recipient_id = this.navParams.get('to_user_id');
  }

  ionViewDidLoad() {
    this.getChatList();
  }

  getChatList() {
    setInterval(() => {
    this.storage.get('api_key').then(api_key => {

      let data = {
        items: {
          order_id: this.navParams.get('order_id'),
          category_id: this.navParams.get('category_id')
        },
        api_key: api_key
      };

      this.orderService.chatList(data)
      .subscribe(result => {
        this.msgList = result.data;
      });

    });
    }, 2000);
  }

  presentAlert(message) {
    let alert = this.alertCtrl.create({
      title: '',
      subTitle: message,
      buttons: ['OK']
    });
    alert.present();
  }

  sendMessage() {
    this.storage.get('api_key').then(api_key => {
      let data = {
        items: {
          order_id: this.navParams.get('order_id'),
          category_id: this.navParams.get('category_id'),
          sender_id: this.user_id,
          message: this.item['msg']
        },
        api_key: api_key
      };

      this.orderService.sendChat(data)
      .subscribe(result => {
        if(result.message == 'OK') {
          this.getChatList();
          this.item['msg'] = "";
          this.scrollToBottom();
        }
        else {
          this.presentAlert('Pesan gagal terkirim!');
        }
      });
    });
  }

  scrollToBottom() {
    setTimeout(() => {
      if(this.content.scrollToBottom){
        this.content.scrollToBottom();
      }
    }, 400);
  }
}
