import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';
import 'rxjs/add/operator/map';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';
import { Observable } from 'rxjs/Observable';

@Injectable()
export class HistoryServiceProvider {

  constructor(public http: Http, public apiUrl: ApiUrlServiceProvider) {

  }

  newHistory(data): Observable<any> {

    let url = this.apiUrl.API_URL + '/v1/order/history/new';
    let headers = new Headers({token: data.api_key});
    let options = new RequestOptions({headers: headers});

    return this.http.post(url, data.items, options)
    .map(res => {
      return res.json()
    })
    .catch(err => {
      console.log(err);
      return err;
    });

  }

  progressHistory(data): Observable<any> {

    let url = this.apiUrl.API_URL + '/v1/order/history/progress';
    let headers = new Headers({token: data.api_key});
    let options = new RequestOptions({headers: headers});

    return this.http.post(url, data.items, options)
    .map(res => {
      return res.json()
    })
    .catch(err => {
      console.log(err);
      return err;
    });

  }

  cancelHistory(data): Observable<any> {

    let url = this.apiUrl.API_URL + '/v1/order/history/cancel';
    let headers = new Headers({token: data.api_key});
    let options = new RequestOptions({headers: headers});

    return this.http.post(url, data.items, options)
    .map(res => {
      return res.json()
    })
    .catch(err => {
      console.log(err);
      return err;
    });

  }

  finishHistory(data): Observable<any> {

    let url = this.apiUrl.API_URL + '/v1/order/history/finish';
    let headers = new Headers({token: data.api_key});
    let options = new RequestOptions({headers: headers});

    return this.http.post(url, data.items, options)
    .map(res => {
      return res.json()
    })
    .catch(err => {
      console.log(err);
      return err;
    });

  }
}
