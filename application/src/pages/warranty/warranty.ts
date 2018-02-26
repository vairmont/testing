import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { InAppBrowser, InAppBrowserOptions } from '@ionic-native/in-app-browser';
import { Storage } from '@ionic/storage/es2015/storage';

@IonicPage()
@Component({
  selector: 'page-warranty',
  templateUrl: 'warranty.html',
})
export class WarrantyPage {

  options : InAppBrowserOptions = {
    location : 'no',//Or 'no' 
    hidden : 'no', //Or  'yes'
    clearcache : 'yes',
    clearsessioncache : 'yes',
    zoom : 'no',//Android only ,shows browser zoom controls 
    hardwareback : 'yes',
    mediaPlaybackRequiresUserAction : 'no',
    shouldPauseOnSuspend : 'no', //Android only 
    closebuttoncaption : 'Close', //iOS only
    disallowoverscroll : 'no', //iOS only 
    toolbar : 'yes', //iOS only 
    enableViewportScale : 'no', //iOS only 
    allowInlineMediaPlayback : 'no',//iOS only 
    presentationstyle : 'pagesheet',//iOS only 
  };

  isCustomer: boolean;

  constructor(public navCtrl: NavController, public navParams: NavParams, public iab: InAppBrowser, public storage: Storage) {
    this.storage.get('role_id').then(role_id => {
      if(role_id == 2) {
        this.isCustomer = true;
      }
      else {
        this.isCustomer = false;
      }
    });
  }

  ionViewDidLoad() {
    
  }

  warrantyRegistration() {
    let url = "https://www.bsisportal.com/bicid/ascportal/warranty_warrantyregistration";
    let target = "_blank";
    const browser = this.iab.create(url, target, this.options);
    browser.show();
  }

  warrantyStatusCheck() {
    let url = "https://www.bsisportal.com/bicid/ascportal/checkingwarranty";
    let target = "_blank";
    const browser = this.iab.create(url, target, this.options);
    browser.show();
  }

  reparationStatusCheck() {
    let url = "https://www.bsisportal.com/bicid/ascportal/warranty_checkcasestatus";
    let target = "_blank";
    const browser = this.iab.create(url, target, this.options);
    browser.show();
  }

}
