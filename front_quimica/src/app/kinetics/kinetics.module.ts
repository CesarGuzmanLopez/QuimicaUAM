import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { KineticsPageRoutingModule } from './kinetics-routing.module';

import { MatFormFieldModule } from '@angular/material/form-field';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { MatSort, MatSortModule } from '@angular/material/sort';
import { MatTableModule } from '@angular/material/table';
import { SharedModules } from 'src/app/shared/shared-modules';
import { KineticsPage } from './kinetics.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    KineticsPageRoutingModule,
    SharedModules,
    MatFormFieldModule,
    MatTableModule,
    MatSortModule,
    MatPaginatorModule,
  ],
  declarations: [KineticsPage],

  exports: [MatPaginator, MatSort],
})
export class KineticsPageModule {}
