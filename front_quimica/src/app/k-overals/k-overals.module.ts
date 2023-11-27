import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { KOveralsPageRoutingModule } from './k-overals-routing.module';

import { KOveralsPage } from './k-overals.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    KOveralsPageRoutingModule
  ],
  declarations: [KOveralsPage]
})
export class KOveralsPageModule {}
