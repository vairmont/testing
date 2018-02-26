import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { HomePage } from '../home/home';
import { FavoriteServiceProvider } from '../../providers/favorite-service/favorite-service';
import { Storage } from '@ionic/storage/es2015/storage';
import { AlertController } from 'ionic-angular/components/alert/alert-controller';
import { LoadingController } from 'ionic-angular/components/loading/loading-controller';
import { CartServiceProvider } from '../../providers/cart-service/cart-service';
import { ApiUrlServiceProvider } from '../../providers/api-url-service/api-url-service';
import { Broadcaster } from '@ionic-native/broadcaster';

@IonicPage()
@Component({
  selector: 'page-favorite',
  templateUrl: 'favorite.html',
})
export class FavoritePage {

  favorites: any;
  imgBaseUrl: any;

  constructor(public navCtrl: NavController, 
    public navParams: NavParams, 
    public favoriteService: FavoriteServiceProvider,
    public storage: Storage,
    public alertCtrl: AlertController,
    public loadingCtrl: LoadingController,
    public cartService: CartServiceProvider,
    public url: ApiUrlServiceProvider,
    public broadcaster: Broadcaster) {
  }

  ionViewDidLoad() {
    this.getFavorite();
    this.imgBaseUrl = this.url.IMG_URL;
  }

  getFavorite() {
    this.storage.get('user_id').then(user_id => {
      this.storage.get('api_key').then(api_key => {

        let item = { user_id: user_id };
        let data = { items: item, api_key: api_key};

        this.favoriteService.getFavorites(data)
        .subscribe(result => {
          if(result.message == 'OK') {
            this.favorites = result.data;
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

  removeFavorite(favorite_id) {
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu..."
    });
    loader.present();

    this.storage.get('api_key').then(api_key => {

      let data = { 
        items: { favorite_id: favorite_id },
        api_key: api_key
      };

      this.favoriteService.removeFavorite(data)
      .subscribe(result => {
        loader.dismiss();
        if(result.message == 'OK') {
          this.presentAlert("Item favorit berhasil dihapus.");
          this.getFavorite();
        }
        else {
          this.presentAlert(result.message[0]);
        }
      });

    });
  }

  removePrompt(favorite_id) {
    let confirm = this.alertCtrl.create({
      title: 'Konfirmasi',
      message: 'Apakah anda yakin ingin menghapus item ini?',
      buttons: [
        {
          text: 'Tidak',
          handler: () => {
          }
        },
        {
          text: 'Ya',
          handler: () => {
            this.removeFavorite(favorite_id);
          }
        }
      ]
    });
    confirm.present();
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

  addFavorite() {
    this.navCtrl.setRoot(HomePage);
  }

}
