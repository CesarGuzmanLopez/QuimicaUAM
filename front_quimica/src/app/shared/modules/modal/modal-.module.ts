import { CommonModule } from '@angular/common';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { ModalRisComponent } from './ris/modal-ris.component';
@NgModule({
  declarations: [ModalRisComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  exports: [ModalRisComponent],
  imports: [CommonModule],
})
export class ModalMoleculesKinects {}
