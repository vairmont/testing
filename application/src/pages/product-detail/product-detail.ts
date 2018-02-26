import { Component } from '@angular/core';
import {AlertController, IonicPage, LoadingController, NavController, NavParams, Platform} from 'ionic-angular';
import {ApiUrlServiceProvider} from "../../providers/api-url-service/api-url-service";
import {CartServiceProvider} from "../../providers/cart-service/cart-service";
import { Storage } from '@ionic/storage/es2015/storage';
import {FavoriteServiceProvider} from "../../providers/favorite-service/favorite-service";
import { Broadcaster } from '@ionic-native/broadcaster';

@IonicPage()
@Component({
  selector: 'page-product-detail',
  templateUrl: 'product-detail.html'
})
export class ProductDetailPage {
  productdata : any;
  baseUrl : any;

  constructor(  public navCtrl: NavController,
                public navParams: NavParams,
                public platform: Platform,
                public alertCtrl: AlertController,
                public storage: Storage,
                public loadingCtrl: LoadingController,
                public url: ApiUrlServiceProvider,
                public cartService: CartServiceProvider,
                public favService : FavoriteServiceProvider,
                public broadcaster: Broadcaster) {
  }

  ionViewDidLoad() {
    this.baseUrl = this.url.IMG_URL;
    this.productdata = this.navParams.get("data");
  }

  qtyPrompt(product_id) {
    let prompt = this.alertCtrl.create({
      title: 'Jumlah Produk',
      message: "Masukkan jumlah produk yang ingin dibeli",
      inputs: [
        {
          name: 'qty',
          placeholder: 'jumlah produk',
          type: 'tel',
          value: '1'
        },
      ],
      buttons: [
        {
          text: 'Batal',
          handler: data => {

          }
        },
        {
          text: 'Beli',
          handler: data => {
            if(data.qty == "") {
              this.presentAlert('Jumlah produk yang ingin dibeli tidak boleh kosong.');
            }
            else {
              this.addToCart(product_id, data.qty);
            }
          }
        }
      ]
    });
    prompt.present();
  }
  addToCart(product_id, qty) {
    let loader = this.loadingCtrl.create({
      content: 'Mohon menunggu...'
    });
    loader.present();

    this.storage.get('user_id').then(user_id => {
      this.storage.get('api_key').then(api_key => {

        let data = {
          items: {
            user_id: user_id,
            product_id: product_id,
            qty: qty
          },
          api_key: api_key
        };

        this.cartService.addCart(data)
          .subscribe(result => {
            loader.dismiss();

            if(result.message == 'OK') {
              this.presentAlert("Berhasil memasukkan ke keranjang belanja.");
              this.storage.set('cart_id',result.data.cart_id);

              this.broadcaster.fireNativeEvent('cart', {}).then(() => {});
            }
            else {
              this.presentAlert("Gagal memasukkan ke keranjang belanja.");
            }
          });

      });
    });
  }

  addFavorite(id){
    let loader = this.loadingCtrl.create({
      content: 'Mohon menunggu...'
    });
    loader.present();

    this.storage.get('user_id').then(user_id => {
      this.storage.get('api_key').then(api_key => {

        let data = {
          items: {
            user_id: user_id,
            product_id : id
          },
          api_key: api_key
        };

        this.favService.addFavorite(data)
          .subscribe(result => {
            loader.dismiss();

            if(result.message == 'OK') {
              this.presentAlert("Berhasil memasukkan item ke daftar favorit.");
            }
            else {
              this.presentAlert("Gagal memasukkan item ke daftar favorit.");
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
