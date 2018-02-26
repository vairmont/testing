import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';
import 'rxjs';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';
import { Observable } from 'rxjs/Observable';

@Injectable()
export class CartServiceProvider {

  constructor(public http: Http, public apiUrl: ApiUrlServiceProvider) {
    
  }

  addCart(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/cart/add';
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

  getCart(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/cart';
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

  removeCart(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/cart/remove';
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

  updateQty(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/cart/qty';
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

  validateVoucher(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/voucher/check';
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
