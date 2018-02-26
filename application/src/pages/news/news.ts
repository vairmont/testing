import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { Storage } from '@ionic/storage/es2015/storage';
import { NewsServiceProvider } from '../../providers/news-service/news-service';
import { ApiUrlServiceProvider } from '../../providers/api-url-service/api-url-service';

@IonicPage()
@Component({
  selector: 'page-news',
  templateUrl: 'news.html',
})
export class NewsPage {

  news: any;
  imgBaseUrl: any;

  constructor(public navCtrl: NavController, public navParams: NavParams, public storage: Storage, public newsService: NewsServiceProvider, public url: ApiUrlServiceProvider) {
  }

  ionViewDidLoad() {
    this.getNewsPromo();
    this.imgBaseUrl = this.url.IMG_URL;
  }

  getNewsPromo() {
    this.storage.get('role_id').then(role_id => {
      this.storage.get('api_key').then(api_key => {
        
        let data = {
          items: {
            role_id: role_id
          },
          api_key: api_key
        };

        this.newsService.getPromo(data)
        .subscribe(result => {
          this.news = result.data;
        });

      });
    });
  }

  refresh(refresher){
    this.getNewsPromo();
    setTimeout(() => {
      refresher.complete();
    }, 2000);
  }

}
