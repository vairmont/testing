import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { CartPage } from '../cart/cart';
import { Storage } from '@ionic/storage/es2015/storage';
import { CartServiceProvider } from '../../providers/cart-service/cart-service';
import { Broadcaster } from '@ionic-native/broadcaster';

@IonicPage()
@Component({
  selector: 'page-navbar-with-cart',
  templateUrl: 'navbar-with-cart.html',
})
export class NavbarWithCartPage {
  roleName: any;
  carts: any;

  constructor(public navCtrl: NavController, public navParams: NavParams, public storage: Storage, public cartService: CartServiceProvider, public broadcaster: Broadcaster) {
    this.storage.get('role_name').then(roleName => { this.roleName = roleName; });
    this.cartList();
    this.broadcaster.addEventListener('cart').subscribe((event) => { this.cartList(); });
  }

  ionViewDidLoad() {
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

  showCart() {
    this.navCtrl.push(CartPage);
  }

}
