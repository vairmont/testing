import { Component } from '@angular/core';
import {AlertController, IonicPage, LoadingController, NavController, NavParams} from 'ionic-angular';
import {ChatPage} from "../chat/chat";
import {CallNumber} from "@ionic-native/call-number";
import { SerialNumberPage } from '../serial-number/serial-number';
import { OfferingPage } from '../offering/offering';
import {OrderServiceProvider} from "../../providers/order-service/order-service";
import {ApiUrlServiceProvider} from "../../providers/api-url-service/api-url-service";
import { Storage } from '@ionic/storage/es2015/storage';
import {Broadcaster} from "@ionic-native/broadcaster";
import { HomePage } from '../home/home';


@IonicPage()
@Component({
  selector: 'page-order',
  templateUrl: 'order.html',
})


export class OrderPage {

  historyStatus: string = "progress";
  orderAs: string = "order";

  orderNew : any;
  itemOrderNew: any;
  orderProgress : any;
  itemOrderProgress: any;
  orderCancel : any;
  itemOrderCancel: any;
  orderFinish : any;
  itemOrderFinish: any;

  constructor(public navCtrl: NavController,
              public navParams: NavParams,
              private callNumber: CallNumber,
              public storage: Storage,
              public alertCtrl: AlertController,
              public loadingCtrl: LoadingController,
              public url: ApiUrlServiceProvider,
              public orderService: OrderServiceProvider,
              public broadcaster: Broadcaster) {
    this.broadcaster.addEventListener('order').subscribe((event) => {
      this.getnewOrder();
      this.getprogressOrder();
      this.getcancelOrder();
      this.getfinishOrder();
    });
  }

  ionViewDidLoad() {
    this.getnewOrder();
    this.getprogressOrder();
    this.getcancelOrder();
    this.getfinishOrder();
  }

  getnewOrder() {
      this.storage.get('user_id').then(user_id => {
        this.storage.get('api_key').then(api_key => {

          let data = {
            items: {
              user_id: user_id
            },
            api_key: api_key
          };

          this.orderService.newOrder(data)
            .subscribe(result => {
              this.orderNew = result.data.orders;
              this.itemOrderNew = result.data.itemDetail;
            });
        });
      });
  }

  getprogressOrder() {
    this.storage.get('user_id').then(user_id => {
      this.storage.get('api_key').then(api_key => {

        let data = {
          items: {
            user_id: user_id
          },
          api_key: api_key
        };

        this.orderService.progressOrder(data)
          .subscribe(result => {
            this.orderProgress = result.data.orders;
            this.itemOrderProgress = result.data.itemDetail;
          });
      });
    });
  }

  getcancelOrder(){
    this.storage.get('api_key').then(api_key => {
      this.storage.get('user_id').then(user_id => {

        let data = {
          items: { user_id: user_id },
          api_key: api_key
        };

        this.orderService.cancelOrder(data)
          .subscribe(result => {
            this.orderCancel = result.data.orders;
            this.itemOrderCancel = result.data.itemDetail;
          });

      });
    });
  }

  getfinishOrder(){
    this.storage.get('api_key').then(api_key => {
      this.storage.get('user_id').then(user_id => {

        let data = {
          items: { user_id: user_id },
          api_key: api_key
        };

        this.orderService.finishOrder(data)
          .subscribe(result => {
            this.orderFinish = result.data.orders;
            this.itemOrderFinish = result.data.itemDetail;
          });

      });
    });
  }

  takeOrder(order_id,category_id){
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu"
    });
    loader.present();

    this.storage.get('api_key').then(api_key => {
      this.storage.get('user_id').then(user_id => {

        let data = {
          items: {
            user_id: user_id,
            order_id: order_id,
            category_id: category_id
          },
          api_key: api_key
        };

        this.orderService.take(data)
          .subscribe(result => {
            if(result.message == 'OK') {
              loader.dismiss();
              this.broadcaster.fireNativeEvent('order', {}).then(() => {});
              this.presentAlert("Order berhasil diambil. Terima kasih.");
            }
            else {
              this.presentAlert("Order gagal diambil");
            }
          });

      });
    });
  }

  showCancelReasonPrompt(order_id, category_id) {
    let prompt = this.alertCtrl.create({
      title: 'Pembatalan Order',
      message: "Masukkan alasan Anda untuk membatalkan pesanan ini",
      inputs: [
        {
          name: 'reason',
          placeholder: 'masukkan alasan anda',
          type: 'text'
        },
      ],
      buttons: [
        {
          text: 'Tutup',
          handler: data => {

          }
        },
        {
          text: 'Selesai',
          handler: data => {
            this.cancel(order_id, category_id, data.reason);
          }
        }
      ]
    });
    prompt.present();
  }

  cancel(order_id, category_id, reason) {

    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu..."
    });

    loader.present();

    this.storage.get('user_id').then(user_id => {
      this.storage.get('api_key').then(api_key => {

        let data = {
          items: {
            order_id: order_id,
            category_id: category_id,
            user_id: user_id,
            reason: reason
          },
          api_key: api_key
        };

        this.orderService.cancel(data)
          .subscribe(result => {
            loader.dismiss();
            if(result.message == 'OK') {
              this.presentAlert('Pesanan berhasil dibatalkan.');
              this.broadcaster.fireNativeEvent('order', {}).then(() => {});
            }
            else {
              this.presentAlert(result.message[0]);
            }
          });

      });
    });
  }

  showConfirmCancel(order_id, category_id) {
    let confirm = this.alertCtrl.create({
      title: 'Konfirmasi',
      message: 'Apakah Anda yakin ingin membatalkan pesanan ini?',
      buttons: [
        {
          text: 'Tidak',
          handler: () => {
          
          }
        },
        {
          text: 'Ya',
          handler: () => {
            this.showCancelReasonPrompt(order_id, category_id);
          }
        }
      ]
    });
    confirm.present();
  }

  showConfirmTakeOrder(order_id,category_id) {
    let confirm = this.alertCtrl.create({
      title: 'Konfirmasi',
      message: 'Apakah Anda yakin ingin mengambil order ini?',
      buttons: [
        {
          text: 'Tidak',
          handler: () => {
            
          }
        },
        {
          text: 'Ya',
          handler: () => {
            this.takeOrder(order_id,category_id);
          }
        }
      ]
    });
    confirm.present();
  }

  doChat(order_id, category_id, to_user_id) {
    let chatItem = { order_id: order_id, category_id: category_id, to_user_id: to_user_id};
    this.navCtrl.push(ChatPage,chatItem);
  }

  doSerialNumber(order_id, category_id) {
    let item = { order_id: order_id, category_id: category_id};
    this.navCtrl.push(SerialNumberPage,item);
  }

  doOffering(order_id,category_id) {
    let item = { order_id: order_id, category_id: category_id};
    this.navCtrl.push(OfferingPage,item);
  }

  doTelp(phone) {
    this.callNumber.callNumber(phone, true)
      .then(() => console.log('Launched dialer!'))
      .catch(() => console.log('Error launching dialer'));
  }

  addOrder() {
    this.navCtrl.setRoot(HomePage);
  }

  presentAlert(message) {
    let alert = this.alertCtrl.create({
      title: '',
      subTitle: message,
      buttons: ['OK']
    });
    alert.present();
  }

  showConfirmCompleteOrder(order_id,category_id) {
    let confirm = this.alertCtrl.create({
      title: 'Konfirmasi',
      message: 'Apakah Anda yakin order ini sudah selesai?',
      buttons: [
        {
          text: 'Tidak',
          handler: () => {

          }
        },
        {
          text: 'Ya',
          handler: () => {
            this.completeOrder(order_id,category_id);
          }
        }
      ]
    });
    confirm.present();
  }

  completeOrder(order_id, category_id) {
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu..."
    });
    loader.present();

    this.storage.get('api_key').then(api_key => {

      let data = {
        items: {
          order_id: order_id,
          category_id: category_id
        },
        api_key: api_key
      };

      this.orderService.markComplete(data)
      .subscribe(result => {
        loader.dismiss();
        if(result.message == 'OK') {
          this.presentAlert("Order telah diselesaikan. Terima kasih.");
          this.broadcaster.fireNativeEvent('order', {}).then(() => {});
        }
        else {
          this.presentAlert("Order gagal diselesaikan. Silahkan coba lagi.");
        }
      });

    });
  }

  refresh(refresher){
    this.getnewOrder();
    this.getprogressOrder();
    this.getcancelOrder();
    this.getfinishOrder();
    setTimeout(() => {
      refresher.complete();
    }, 2000);
  }
}
