import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';
import 'rxjs';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';
import { Observable } from 'rxjs/Observable';

@Injectable()
export class FavoriteServiceProvider {

  constructor(public http: Http, public apiUrl: ApiUrlServiceProvider) {
    
  }

  getFavorites(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/favorites';
    let headers = new Headers({token: data.api_key});
    let options = new RequestOptions({headers: headers});

    return this.http.post(url,data.items,options)
      .map(res => {
        return res.json();
      })
      .catch(err => {
        console.log(err);
        return err;
      });
  }

  addFavorite(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/favorite/add';
    let headers = new Headers({token: data.api_key});
    let options = new RequestOptions({headers: headers});

    return this.http.post(url,data.items,options)
      .map(res => {
        return res.json();
      })
      .catch(err => {
        console.log(err);
        return err;
      });
  }

  removeFavorite(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/favorite/remove';
    let headers = new Headers({token: data.api_key});
    let options = new RequestOptions({headers: headers});

    return this.http.post(url,data.items,options)
      .map(res => {
        return res.json();
      })
      .catch(err => {
        console.log(err);
        return err;
      });
  }
}
