import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { Storage } from '@ionic/storage/es2015/storage';
import { OrderServiceProvider } from '../../providers/order-service/order-service';
import { LoadingController } from 'ionic-angular/components/loading/loading-controller';
import { AlertController } from 'ionic-angular/components/alert/alert-controller';
import { Broadcaster } from '@ionic-native/broadcaster';

@IonicPage()
@Component({
  selector: 'page-offering',
  templateUrl: 'offering.html',
})
export class OfferingPage {

  itemList: any;
  order_id: any;
  category_id: any;

  data = [];
  price = {};

  constructor(public navCtrl: NavController, public navParams: NavParams, public storage: Storage, public orderService: OrderServiceProvider, public loadingCtrl: LoadingController, public alertCtrl: AlertController, public broadcaster: Broadcaster) {
    this.order_id = this.navParams.get('order_id');
    this.category_id = this.navParams.get('category_id');
  }

  ionViewDidLoad() {
    this.getOfferingData();
  }

  getOfferingData() {
    this.storage.get('api_key').then(api_key => {

      let data = {
        items: {
          order_id: this.order_id,
          category_id: this.category_id
        },
        api_key: api_key
      };

      this.orderService.offeringlist(data)
        .subscribe(result => {
          this.itemList = result.data;

          result.data.forEach(obj => {
            this.price[obj.product_id] = obj.nego_price;
          });

        });
    });
  }

  pushToArray(id, price) {
    this.data.push({
      "product_id": id,
      "price": price
    });
  }

  storeData(id) {
    if(id != "" || this.price[id] != "") {
      this.pushToArray(id, this.price[id]);
    }
  }

  presentAlert(message) {
    let alert = this.alertCtrl.create({
      title: '',
      subTitle: message,
      buttons: ['OK']
    });
    alert.present();
  }

  submitOffering() {
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu"
    });
    loader.present();

    this.storage.get('api_key').then(api_key => {

      let data = {
        items: {
          order_id: this.order_id,
          category_id: this.category_id,
          item: this.data
        },
        api_key: api_key
      };

      this.orderService.submitOffering(data)
      .subscribe(result => {
        loader.dismiss();
        if(result.message == 'OK') {
          this.presentAlert("Data penawaran harga berhasil diinput. Silahkan tunggu proses persetujuan dari pihak pembeli.");
          this.broadcaster.fireNativeEvent('order', {}).then(() => {});
        }
        else {
          this.presentAlert("Data penawaran harga gagal diproses.");
        }
      });

    });
  }

}
