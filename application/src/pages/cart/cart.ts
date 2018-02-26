import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, AlertController, LoadingController } from 'ionic-angular';
import { CustomerDetailPage } from '../customer-detail/customer-detail';
import { CartServiceProvider } from '../../providers/cart-service/cart-service';
import { Storage } from '@ionic/storage/es2015/storage';
import { ApiUrlServiceProvider } from '../../providers/api-url-service/api-url-service';
import { Broadcaster } from '@ionic-native/broadcaster';

@IonicPage()
@Component({
  selector: 'page-cart',
  templateUrl: 'cart.html',
})
export class CartPage {

  carts: any;
  imgBaseUrl:any;
  voucher = {code: ""};

  constructor(public navCtrl: NavController,
    public navParams: NavParams,
    public cartService: CartServiceProvider,
    public storage: Storage,
    public url: ApiUrlServiceProvider,
    public alertCtrl: AlertController,
    public loadingCtrl: LoadingController,
    public broadcaster: Broadcaster) {
  }

  ionViewDidLoad() {
    this.cartList();
    this.imgBaseUrl = this.url.IMG_URL;
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
              this.carts = result.data;
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

  removeCart(cart_id, product_id) {
    let loader = this.loadingCtrl.create({
      content: "Mohon menunggu..."
    });
    loader.present();

    this.storage.get('api_key').then(api_key => {

      let data = { 
        items: { cart_id: cart_id, product_id: product_id },
        api_key: api_key
      };

      this.cartService.removeCart(data)
      .subscribe(result => {
        loader.dismiss();
        if(result.message == 'OK') {
          this.presentAlert("Item berhasil dihapus.");
          this.cartList();
          this.broadcaster.fireNativeEvent('cart', {}).then(() => {});
        }
        else {
          this.presentAlert(result.message[0]);
        }
      });

    });
  }

  removePrompt(cart_id, product_id) {
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
            this.removeCart(cart_id, product_id);
          }
        }
      ]
    });
    confirm.present();
  }

  qtyPrompt(cart_id, product_id, type) {
    let prompt = this.alertCtrl.create({
      title: 'Jumlah Produk',
      message: "Masukkan jumlah produk",
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
          text: 'Ubah',
          handler: data => {
            if(data.qty == "") {
              this.presentAlert('Jumlah produk tidak boleh kosong.');
            }
            else {
              let qty;

              if(type == 'increase') {
                qty = data.qty;
              }
              else if(type == 'decrease') {
                qty = "-"+data.qty;
              }

              this.updateQty(cart_id, product_id, qty);
            }
          }
        }
      ]
    });
    prompt.present();
  }

  updateQty(cart_id, product_id, qty) {
    let loader = this.loadingCtrl.create({
      content: 'Mohon menunggu...'
    });
    loader.present();

    this.storage.get('user_id').then(user_id => {
      this.storage.get('api_key').then(api_key => {
        
        let data = {
          items: {
            cart_id: cart_id,
            product_id: product_id,
            qty: qty
          },
          api_key: api_key
        };

        this.cartService.updateQty(data)
        .subscribe(result => {
          loader.dismiss();
          if(result.message == 'OK') {
            this.cartList();
            this.broadcaster.fireNativeEvent('cart', {}).then(() => {});
          }
          else if(result.message == 'Invalid qty') {
            this.presentAlert('Jumlah produk yang dimasukkan tidak boleh lebih dari yang sudah ada.');
          }
          else {
            this.presentAlert(result.message[0]);
          }
        });

      });
    });
  }

  useVoucherPrompt(data) {
    let confirm = this.alertCtrl.create({
      title: 'Konfirmasi',
      message: 'Apakah anda ingin menggunakan kupon diskon ini?',
      buttons: [
        {
          text: 'Tidak',
          handler: () => {
          }
        },
        {
          text: 'Ya',
          handler: () => {
            this.storage.set('voucher_id', data.voucher_id);
            this.storage.set('voucher_product_category', data.product_category);
            this.storage.set('discount_rate', data.discount_rate);
            this.storage.set('voucher_code', data.voucher_code);
          }
        }
      ]
    });
    confirm.present();
  }

  checkVoucher() {
    let loader = this.loadingCtrl.create({
      content: 'Mohon menunggu'
    });

    loader.present();

    this.storage.get('role_id').then(role_id => {
      this.storage.get('api_key').then(api_key => {
        
        let data = {
          items: {role_id: role_id, voucher_code: this.voucher['code']},
          api_key: api_key
        };

        this.cartService.validateVoucher(data)
        .subscribe(result => {
          loader.dismiss();
          if(result.message == 'OK') {
            this.useVoucherPrompt(result.data);
          }
          else {
            this.presentAlert(result.message[0]);
          }
        });

      });
    });
  }

  goToCustomerDetail() {
    this.navCtrl.push(CustomerDetailPage);
  }

}
