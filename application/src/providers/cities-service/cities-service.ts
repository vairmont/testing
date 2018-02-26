import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';
import {Observable} from "rxjs/Observable";
import "rxjs";

@Injectable()
export class CitiesServiceProvider {

  constructor(public http: Http, public apiUrl: ApiUrlServiceProvider) {

  }

  getCities():Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/cities';
    return this.http.get(url)
      .map(res => {
        return res.json();
      })
      .catch(err => {
        console.log(err);
        return err;
      });
  }
}
