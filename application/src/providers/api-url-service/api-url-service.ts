import { Injectable } from '@angular/core';

@Injectable()
export class ApiUrlServiceProvider {

  constructor() {
  }

  public API_URL:any = "http://ishopbrother.com/api/public";
  public IMG_URL:any = "http://ishopbrother.com/admin";
}
