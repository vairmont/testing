import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { NavbarWithoutCartPage } from './navbar-without-cart';

@NgModule({
  declarations: [
    NavbarWithoutCartPage,
  ],
  imports: [
    IonicPageModule.forChild(NavbarWithoutCartPage),
  ],
})
export class NavbarWithoutCartPageModule {}
