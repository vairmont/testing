import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { SerialNumberPage } from './serial-number';

@NgModule({
  declarations: [
    SerialNumberPage,
  ],
  imports: [
    IonicPageModule.forChild(SerialNumberPage),
  ],
})
export class SerialNumberPageModule {}
