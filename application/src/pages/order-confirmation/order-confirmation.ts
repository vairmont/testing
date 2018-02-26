import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { HomePage } from '../home/home';
import { LoadingController } from 'ionic-angular/components/loading/loading-controller';
import { AlertController } from 'ionic-angular/components/alert/alert-controller';
import { CartServiceProvider } from '../../providers/cart-service/cart-service';
import { OrderServiceProvider } from '../../providers/order-service/order-service';
import { Storage } from '@ionic/storage/es2015/storage';
import { ApiUrlServiceProvider } from '../../providers/api-url-service/api-url-service';
import { Broadcaster } from '@ionic-native/broadcaster';

@IonicPage()
@Component({
  selector: 'page-order-confirmation',
  templateUrl: 'order-confirmation.html',
})
export class OrderConfirmationPage {
  user: any;
  carts: any;
  baseImgUrl:any;
  voucherCode: any;
  discount: any;
  subtotal: number = 0;
  discountVal: number = 0;
  total: number = 0;
  discountCategory: any = "all";

  constructor(public navCtrl: NavController,
    public navParams: NavParams,
    public loadingCtrl: LoadingController,
    public alertCtrl: AlertController,
    public cartService: CartServiceProvider,
    public orderService: OrderServiceProvider,
    public storage: Storage,
    public url: ApiUrlServiceProvider,
    public broadcaster: Broadcaster) {
  }

  ionViewDidLoad() {
    this.user = this.navParams.get('user');
    this.baseImgUrl = this.url.IMG_URL;
    this.cartList();
  }

  cartList() {
    this.storage.get('user_id').then(user_id => {
      this.storage.get('cart_id').then(cart_id => {
        this.storage.get('api_key').then(api_key => {
          let data = {
            items: {
              user_id: user_id,
              cart_id: cart_id,
            },
            api_key: api_key
          };
          this.cartService.getCart(data)
          .subscribe(result => {
            this.storage.get('discount_rate').then(discount_rate => {
              this.storage.get('voucher_code').then(voucher_code => {
                this.storage.get('voucher_product_category').then(voucher_product_category => {

                  this.discount = (discount_rate != null) ? discount_rate : 0;
                  this.voucherCode = (voucher_code != null) ? voucher_code : "-";
                  this.carts = result.data;

                  result.data.forEach(obj => {
                    this.subtotal = obj.subtotal;
                    this.total = obj.total;
                    this.discountVal = this.discountVal;
                    this.discountCategory = this.discountCategory;

                    if(obj.category_id == voucher_product_category) {
                      this.discountVal = (obj.price * obj.qty) * (discount_rate / 100);
                      this.total = this.subtotal - this.discountVal;
                      this.discountCategory = obj.category_name;
                    }
                    else {
                      this.discountVal = this.discountVal;
                      this.total = this.total;
                      this.discountCategory = this.discountCategory;
                    }
                  });

                });
              });
            });
          });
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

  order() {
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu..."
    });
    loader.present();

    this.storage.get('user_id').then(user_id => {
      this.storage.get('api_key').then(api_key => {
        this.storage.get('cart_id').then(cart_id => {
          this.storage.get('voucher_product_category').then(voucher_product_category => {
            this.storage.get('voucher_id').then(voucher_id => {

              let data = {
                items: { 
                  user_id: user_id, 
                  cart_id: cart_id,
                  voucher_id: voucher_id,
                  voucher_category_id: voucher_product_category,
                  name: this.user.name,
                  email: this.user.email,
                  phone: this.user.phone,
                  address_1: this.user.address_1,
                  lat: this.user.lat,
                  lng: this.user.lng,
                  address_2: this.user.address_2,
                  city_id: this.user.city_id,
                  zip_code: this.user.zip_code
                },
                api_key: api_key
              };

              this.orderService.checkout(data)
              .subscribe(result => {
                loader.dismiss();
                if(result.message == 'OK') {
                  this.presentAlert('Terima kasih. Order anda sudah dibuat.');
                  this.broadcaster.fireNativeEvent('order', {}).then(() => {});

                  this.storage.remove('cart_id');
                  this.storage.remove('voucher_id');
                  this.storage.remove('voucher_product_category');
                  this.storage.remove('discount_rate');
                  this.storage.remove('voucher_code');

                  this.navCtrl.setRoot(HomePage);
                  this.navCtrl.popToRoot();
                }
                else {
                  this.presentAlert('Gagal membuat order.');
                }
              });

            });
          });
        });
      });
    });
  }
}
