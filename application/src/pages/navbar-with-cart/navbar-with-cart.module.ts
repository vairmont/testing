import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { NavbarWithCartPage } from './navbar-with-cart';

@NgModule({
  declarations: [
    NavbarWithCartPage,
  ],
  imports: [
    IonicPageModule.forChild(NavbarWithCartPage),
  ],
})
export class NavbarWithCartPageModule {}
