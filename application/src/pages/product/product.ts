import { Component } from '@angular/core';
import {IonicPage, LoadingController, NavController, NavParams, AlertController} from 'ionic-angular';
import {ProductDetailPage} from "../product-detail/product-detail";
import {ProductServiceProvider} from "../../providers/product-service/product-service"
import { Storage } from '@ionic/storage/es2015/storage';
import { ApiUrlServiceProvider } from '../../providers/api-url-service/api-url-service';
import {CartServiceProvider} from "../../providers/cart-service/cart-service";
import { Broadcaster } from '@ionic-native/broadcaster';

@IonicPage()
@Component({
  selector: 'page-product',
  templateUrl: 'product.html',
})
export class ProductPage {
  products : any;
  id : any;
  baseUrl : any;
  searchTerm: any = "";
  searching: boolean;

  constructor(
    public navCtrl: NavController, public navParams: NavParams,
    public productService: ProductServiceProvider,
    public storage: Storage,
    public alertCtrl: AlertController,
    public loadingCtrl: LoadingController,
    public url: ApiUrlServiceProvider,
    public cartService: CartServiceProvider,
    public broadcaster: Broadcaster
    ) {
  }

  ionViewDidLoad() {
    this.baseUrl = this.url.IMG_URL;

    this.id = this.navParams.get("id");

    if (this.id == "all") {
      this.getProduct();
    }
    else {
      this.getProductbyCategory();
    }

  }

  doDetailProduct(product) {
    this.navCtrl.push(ProductDetailPage,{data:product});
  }

  getProductbyCategory() {
    this.storage.get('role_id').then(role_id => {
      this.storage.get('api_key').then(api_key => {

        let data = {
          items: {
            role_id: role_id,
            category_id: this.id
          },
          api_key: api_key
        };

        this.productService.getProductByCategory(data)
          .subscribe(result => {
            this.products = result.data;
          });
      });
    });
  }

  getProduct() {
    this.storage.get('role_id').then(role_id => {
      this.storage.get('api_key').then(api_key => {

        let data = {
          items: {
            role_id: role_id,
          },
          api_key: api_key
        };

        this.productService.getProduct(data)
          .subscribe(result => {
            this.products = result.data;
          });
      });
    });
  }

  setFilteredItems() {
    this.searching = true;

    if(this.searchTerm.toString() != "") {
      this.products = this.products.filter(product => {
        this.searching = false;
        return product.product_name.toString().toLowerCase().indexOf(this.searchTerm.toString().toLowerCase()) > -1;
      });
    }
    else {
      this.searching = false;
      this.products = this.getProduct();
    }
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

  presentAlert(message) {
    let alert = this.alertCtrl.create({
      title: '',
      subTitle: message,
      buttons: ['OK']
    });
    alert.present();
  }
}
