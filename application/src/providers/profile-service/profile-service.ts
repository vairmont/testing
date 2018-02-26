import { Injectable } from '@angular/core';
import {Http, Headers, RequestOptions} from '@angular/http';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';
import {Observable} from "rxjs/Observable";
import "rxjs";

@Injectable()
export class ProfileServiceProvider {

  constructor(public http: Http,public apiUrl: ApiUrlServiceProvider) {

  }
  getProfile(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/profile';
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
  updateProfile(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/profile/edit';
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
  changePassword(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/profile/changePassword';
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
