import { Component } from '@angular/core';

import { HomePage } from '../home/home';
import {HistoryPage} from "../history/history";
import {ServicePage} from "../service/service";
import {SettingsPage} from "../settings/settings";
import { OrderPage } from '../order/order';
import { NewsPage } from '../news/news';
import { Storage } from '@ionic/storage/es2015/storage';

@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root: any;
  tab2Root: any;
  tab3Root: any;
  tab4Root: any;
  tab5Root: any;
  tab6Root: any;

  isCustomer: boolean;

  constructor(private storage: Storage) {
    this.storage.get('role_id').then(role_id => {
      if(role_id == 2) {
        this.isCustomer = true;
      }
      else {
        this.isCustomer = false;
      }
    });
  }

  ngOnInit() {
    this.tab1Root = HomePage;
    this.tab2Root = OrderPage;
    this.tab3Root = NewsPage;
    this.tab4Root = HistoryPage;
    this.tab5Root = ServicePage;
    this.tab6Root = SettingsPage;
  }
}
