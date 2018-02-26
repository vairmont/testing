import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { OfferingPage } from './offering';

@NgModule({
  declarations: [
    OfferingPage,
  ],
  imports: [
    IonicPageModule.forChild(OfferingPage),
  ],
})
export class OfferingPageModule {}
