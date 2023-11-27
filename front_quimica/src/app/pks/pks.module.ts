import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { PksPageRoutingModule } from './pks-routing.module';

import { PksPage } from './pks.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    PksPageRoutingModule
  ],
  declarations: [PksPage]
})
export class PksPageModule {}
