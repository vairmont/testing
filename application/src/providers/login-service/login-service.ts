import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';
import { Observable } from 'rxjs/Observable';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';

@Injectable()
export class LoginServiceProvider {

  constructor(public http: Http, public apiUrl: ApiUrlServiceProvider) {
  }

  login(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/login';

    return this.http.post(url,data)
      .map(res => {
        return res.json();
      })
      .catch(err => {
        console.log(err);
        return err;
      });
  }

  logout(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/logout';

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
