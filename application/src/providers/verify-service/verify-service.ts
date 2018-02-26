import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';
import { Observable } from 'rxjs/Observable';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';

/*
  Generated class for the VerifyServiceProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class VerifyServiceProvider {

  constructor(public http: Http, public apiUrl: ApiUrlServiceProvider) {
    
  }

  verifyRequest(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/sms/verify/request';

    return this.http.post(url,data)
    .map(res => {
      return res.json();
    })
    .catch(err => {
      console.log(err);
      return err;
    });
  }

  verifyCheck(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/sms/verify/check';

    return this.http.post(url,data)
    .map(res => {
      return res.json();
    })
    .catch(err => {
      console.log(err);
      return err;
    });
  }
}
