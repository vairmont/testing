import { Injectable } from '@angular/core';
import {Http, RequestOptions, Headers} from '@angular/http';
import 'rxjs';
import { Observable } from 'rxjs/Observable';
import { ApiUrlServiceProvider } from '../api-url-service/api-url-service';

@Injectable()
export class TicketServiceProvider {

  constructor(public http: Http, public apiUrl: ApiUrlServiceProvider) {
  }
  addTicket(data):Observable<any> {
    let url = this.apiUrl.API_URL + '/v1/ticket/add';
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
