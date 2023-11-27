import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { KOveralsPage } from './k-overals.page';

const routes: Routes = [
  {
    path: '',
    component: KOveralsPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class KOveralsPageRoutingModule {}
