import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';
import 'rxjs';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';
import { Observable } from 'rxjs/Observable';

@Injectable()
export class OrderServiceProvider {

  constructor(public http: Http, public apiUrl: ApiUrlServiceProvider) {

  }

  checkout(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/order/checkout';
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

  take(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/order/take';
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

  cancel(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/order/cancel';
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

  approve(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/order/approve';
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

  chatList(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/order/chatList';
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

  sendChat(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/order/chat';
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

  newOrder(data): Observable<any> {

    let url = this.apiUrl.API_URL + '/v1/orders/new';
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

  progressOrder(data): Observable<any> {

    let url = this.apiUrl.API_URL + '/v1/orders/progress';
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

  cancelOrder(data): Observable<any> {

    let url = this.apiUrl.API_URL + '/v1/orders/cancel';
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

  finishOrder(data): Observable<any> {

    let url = this.apiUrl.API_URL + '/v1/orders/finish';
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

  offeringlist(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/order/offeringList';
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

  submitOffering(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/order/offering';
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

  licenseList(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/order/licenseList';
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

  submitLicense(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/order/licenseNumber';
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

  markComplete(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/order/complete';
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
