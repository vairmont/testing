import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';
import { Observable } from 'rxjs/Observable';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';

@Injectable()
export class ForgotPasswordServiceProvider {

  constructor(public http: Http, public apiUrl: ApiUrlServiceProvider) {
    
  }

  forgotPassword(data): Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/forgotPassword';

    return this.http.post(url, data)
    .map(res => {
      return res.json();
    })
    .catch(err => {
      console.log(err);
      return err;
    });
  }
}
