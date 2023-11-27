import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { IonicModule } from '@ionic/angular';
import { ModalMoleculesKinects } from './modules/modal/modal-.module';
@NgModule({
  declarations: [],
  imports: [CommonModule, ModalMoleculesKinects, IonicModule],
  exports: [ModalMoleculesKinects, IonicModule],
})
export class SharedModules {}
