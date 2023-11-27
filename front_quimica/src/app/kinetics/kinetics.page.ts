import {
  animate,
  state,
  style,
  transition,
  trigger,
} from '@angular/animations';
import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Molecule } from 'src/app/shared/interfaces/Molecule';
import { MoleculesService } from 'src/app/shared/services/Chemistry/molecules.service';
@Component({
  selector: 'app-kinetics',
  templateUrl: './kinetics.page.html',
  styleUrls: ['./kinetics.page.scss'],
  animations: [
    trigger('detailExpand', [
      state('collapsed,void', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition(
        'expanded <=> collapsed',
        animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')
      ),
    ]),
  ],
})
export class KineticsPage implements AfterViewInit, OnInit {
  molecules: Molecule[] = [];
  dataSource!: MatTableDataSource<Molecule>;
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  columnsToDisplay = ['Name', 'Smile'];
  columnsToDisplayWithExpand = [...this.columnsToDisplay, 'expand'];
  expandedElement!: Molecule | null;
  constructor(private moleculesService: MoleculesService) {}

  ngOnInit(): void {
    this.moleculesService.getMolecules().subscribe({
      next: (molecules) => {
        this.molecules = molecules;
        this.dataSource = new MatTableDataSource(this.molecules);
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
      },
      error: (error) => {
        console.error('Error al obtener datos:', error);
      },
    });
  }
  ngAfterViewInit(): void {}
}
