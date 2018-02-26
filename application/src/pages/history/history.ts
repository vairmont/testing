import { Component } from '@angular/core';
import {IonicPage, NavController, NavParams, AlertController} from 'ionic-angular';
import {ChatPage} from "../chat/chat";
import {CallNumber} from "@ionic-native/call-number";
import { HomePage } from '../home/home';
import { HistoryServiceProvider } from '../../providers/history-service/history-service';
import { Storage } from '@ionic/storage/es2015/storage';
import { OrderServiceProvider } from '../../providers/order-service/order-service';
import { LoadingController } from 'ionic-angular/components/loading/loading-controller';
import { Broadcaster } from '@ionic-native/broadcaster';

@IonicPage()
@Component({
  selector: 'page-history',
  templateUrl: 'history.html',
})
export class HistoryPage {
  // set default tabs onInit
  historyStatus: string = "new";

  newHistories: any;
  itemsNewHistories: any;

  progressHistories: any;
  itemsProgressHistories: any;

  cancelHistories: any;
  itemsCancelHistories: any;

  finishHistories: any;
  itemsFinishHistories: any;

  constructor(public navCtrl: NavController, 
    public navParams: NavParams, 
    public alertCtrl: AlertController,
    public callNumber: CallNumber,
    public historyService: HistoryServiceProvider,
    public storage: Storage,
    public orderService: OrderServiceProvider,
    public loadingCtrl: LoadingController,
    public broadcaster: Broadcaster) {

      this.broadcaster.addEventListener('order').subscribe((event) => { 
        this.getNewHistory();
        this.getCancelHistory();
        this.getProgressHistory();
        this.getFinishHistory();
      });
  }

  ionViewDidLoad() {
    this.getNewHistory();
    this.getCancelHistory();
    this.getProgressHistory();
    this.getFinishHistory();
  }

  getNewHistory() {
    
    this.storage.get('api_key').then(api_key => {
      this.storage.get('user_id').then(user_id => {

        let data = {
          items: { user_id: user_id},
          api_key: api_key
        };

        this.historyService.newHistory(data)
        .subscribe(result => {
          this.newHistories = result.data.orders;
          this.itemsNewHistories = result.data.itemDetail;
        });

      });
    });

  }

  getProgressHistory() {
    this.storage.get('api_key').then(api_key => {
      this.storage.get('user_id').then(user_id => {

        let data = {
          items: { user_id: user_id},
          api_key: api_key
        };

        this.historyService.progressHistory(data)
        .subscribe(result => {
          this.progressHistories = result.data.orders;
          this.itemsProgressHistories = result.data.itemDetail;
        });

      });
    });
  }

  getCancelHistory() {
    this.storage.get('api_key').then(api_key => {
      this.storage.get('user_id').then(user_id => {

        let data = {
          items: { user_id: user_id},
          api_key: api_key
        };

        this.historyService.cancelHistory(data)
        .subscribe(result => {
          this.cancelHistories = result.data.orders;
          this.itemsCancelHistories = result.data.itemDetail;
        });

      });
    });
  }

  getFinishHistory() {
    this.storage.get('api_key').then(api_key => {
      this.storage.get('user_id').then(user_id => {

        let data = {
          items: { user_id: user_id},
          api_key: api_key
        };

        this.historyService.finishHistory(data)
        .subscribe(result => {
          this.finishHistories = result.data.orders;
          this.itemsFinishHistories = result.data.itemDetail;
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

  showConfirmDeal(order_id, category_id) {
    let confirm = this.alertCtrl.create({
      title: 'Konfirmasi',
      message: 'Apakah Anda yakin ingin menyetujui penawaran ini?',
      buttons: [
        {
          text: 'Tidak',
          handler: () => {
            
          }
        },
        {
          text: 'Ya',
          handler: () => {
            this.approveOrder(order_id, category_id);
          }
        }
      ]
    });
    confirm.present();
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
            this.cancelOrder(order_id, category_id, data.reason);
          }
        }
      ]
    });
    prompt.present();
  }

  cancelOrder(order_id, category_id, reason) {

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

  approveOrder(order_id, category_id) {
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

      this.orderService.approve(data)
      .subscribe(result => {
        loader.dismiss();
        if(result.message == 'OK') {
          this.presentAlert('Pesanan sudah dikonfirmasi.');
          this.broadcaster.fireNativeEvent('order', {}).then(() => {});
        }
        else {
          this.presentAlert(result.message[0]);
        }
      });

    });
  }

  doChat(order_id, category_id, to_user_id) {
    let chatItem = { order_id: order_id, category_id: category_id, to_user_id: to_user_id};
    this.navCtrl.push(ChatPage, chatItem);
  }

  doTelp(phoneNumber) {
    this.callNumber.callNumber(phoneNumber, true)
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

  refresh(refresher){
    this.getNewHistory();
    this.getCancelHistory();
    this.getProgressHistory();
    this.getFinishHistory();
    setTimeout(() => {
      refresher.complete();
    }, 2000);
  }

}
