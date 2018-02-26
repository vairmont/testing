import { Component } from '@angular/core';
import { AlertController, IonicPage, LoadingController, NavController, NavParams } from 'ionic-angular';
import { BarcodeScanner } from '@ionic-native/barcode-scanner';
import { OrderServiceProvider } from "../../providers/order-service/order-service";
import { Storage } from '@ionic/storage/es2015/storage';
import { Broadcaster } from '@ionic-native/broadcaster';

@IonicPage()
@Component({
  selector: 'page-serial-number',
  templateUrl: 'serial-number.html',
})

export class SerialNumberPage {
  barcodeText = {};
  data = [];

  itemList: any;
  order_id: any;
  category_id: any;

  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    public barcodeScanner: BarcodeScanner,
    public alertCtrl: AlertController,
    public loadingCtrl: LoadingController,
    public orderService: OrderServiceProvider,
    public storage: Storage,
    public broadcaster: Broadcaster
  ) {  
    this.order_id = this.navParams.get('order_id');
    this.category_id = this.navParams.get('category_id');
  }

  ionViewDidLoad() {
    this.getLicenseList();
  }

  getLicenseList(){
    this.storage.get('api_key').then(api_key => {

      let data = {
        items: {
          order_id: this.order_id,
          category_id: this.category_id
        },
        api_key: api_key
      };

      this.orderService.licenseList(data)
        .subscribe(result => {
          this.itemList = result.data;
        });
    });
  }

  pushToArray(id,key) {
    this.data.push({
      "order_item_detail_id": id,
      "serial_number": key
    });
  }

  scan(id) {
    this.barcodeScanner.scan().then((barcodeData) => {
      // Success! Barcode data is here
      this.barcodeText[id] = barcodeData.text;

      if(id != "" || barcodeData.text != "") {
        this.pushToArray(id, barcodeData.text);
      }

     }, (err) => {
         // An error occurred
     });
  }

  storeData(id) {
    if(id != "" || this.barcodeText[id] != "") {
      this.pushToArray(id, this.barcodeText[id]);
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

  submitSerialNumber() {

    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu"
    });
    loader.present();

    this.storage.get('api_key').then(api_key => {
      let item = {
        items: { 
          order_id: this.order_id,
          category_id: this.category_id,
          data: this.data
        },
        api_key: api_key
      };

      this.orderService.submitLicense(item)
      .subscribe(result => {
        loader.dismiss();
        if(result.message == 'OK') {
          this.presentAlert("Terima kasih telah menyelesaikan pesanan ini. Data nomor serial berhasil diinput.");
          this.broadcaster.fireNativeEvent('order', {}).then(() => {});
        }
        else {
          this.presentAlert("Data nomor serial gagal diinput.");
        }
      });

    });
  }

}
