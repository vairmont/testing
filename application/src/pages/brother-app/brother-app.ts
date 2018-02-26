import { Component } from '@angular/core';
import {IonicPage, NavController, NavParams} from 'ionic-angular';
import { Device } from '@ionic-native/device';

@IonicPage()
@Component({
  selector: 'page-brother-app',
  templateUrl: 'brother-app.html',
})
export class BrotherAppPage {
  platform: string;
  brotherSupportCenter: string;
  brotherIprintScan: string;
  brotherIprintLabel: string;
  brotherMobileCable: string;
  brotherMobileTransfer: string;

  constructor(public navCtrl: NavController, public navParams: NavParams, public device: Device) {
  }

  ionViewDidLoad() {
    this.platform = this.device.platform;

    if(this.platform === "Android") {
      this.brotherSupportCenter = "https://play.google.com/store/apps/details?id=com.brother.product.bsc";
      this.brotherIprintScan = "https://play.google.com/store/apps/details?id=com.brother.mfc.brprint";
      this.brotherIprintLabel = "https://play.google.com/store/apps/details?id=com.brother.ptouch.iprintandlabel";
      this.brotherMobileCable = "https://play.google.com/store/apps/details?id=com.brother.ptouch.cablelabel";
      this.brotherMobileTransfer = "https://play.google.com/store/apps/details?id=com.brother.ptouch.transferexpress";
    }
    else if(this.platform === "iOS") {
      this.brotherSupportCenter = "https://itunes.apple.com/id/app/brother-supportcenter/id953350007?mt=8";
      this.brotherIprintScan = "https://itunes.apple.com/id/app/brother-iprint-scan/id382775642?mt=8";
      this.brotherIprintLabel = "https://itunes.apple.com/id/app/brother-iprint-label/id523047493?mt=8";
      this.brotherMobileCable = "https://itunes.apple.com/id/app/mobile-cable-label-tool/id898132498?mt=8";
      this.brotherMobileTransfer = "https://itunes.apple.com/id/app/brother-mobile-transfer-express/id872913387?mt=8";
    }
    else {
      console.log('You are not running on any device');
    }
  }

}
