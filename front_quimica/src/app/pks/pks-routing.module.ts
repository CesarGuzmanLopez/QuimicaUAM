import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { PksPage } from './pks.page';

const routes: Routes = [
  {
    path: '',
    component: PksPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PksPageRoutingModule {}
