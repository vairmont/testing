import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';
import { Observable } from 'rxjs/Observable';

@Injectable()
export class RegisterServiceProvider {

  constructor(public http: Http, public apiUrl: ApiUrlServiceProvider) {

  }

  registerCustomer(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/register/customer';

    return this.http.post(url,data)
    .map(res => {
      return res.json();
    })
    .catch(err => {
      console.log(err);
      return err;
    })
  }

  registerReseller(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/register/reseller';

    return this.http.post(url,data)
    .map(res => {
     return res.json();
    })
    .catch(err => {
      console.log(err);
      return err;
    })
  }

}
