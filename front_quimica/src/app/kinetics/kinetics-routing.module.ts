import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { KineticsPage } from './kinetics.page';

const routes: Routes = [
  {
    path: '',
    component: KineticsPage,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class KineticsPageRoutingModule {}
