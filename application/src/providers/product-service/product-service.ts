import { Injectable } from '@angular/core';
import {Http, Headers, RequestOptions} from '@angular/http';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';
import {Observable} from "rxjs/Observable";
import "rxjs";

@Injectable()
export class ProductServiceProvider {
  constructor(public http: Http,public apiUrl: ApiUrlServiceProvider) {
  }

  getProduct(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/products';
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

  getProductByCategory(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/productByCategory';
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
