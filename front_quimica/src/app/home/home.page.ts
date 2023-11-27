import { Component, OnInit } from '@angular/core';
import { WebApps } from '../shared/interfaces/apps';
import { SesionService } from '../shared/services/session/sesion.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit {
  webApps: WebApps[] = [];
  constructor(private sesionService: SesionService) {}
  ngOnInit(): void {
    this.sesionService.getWebApps().subscribe({
      next: (webApps) => {
        this.webApps = webApps;
        console.log('Datos obtenidos:', webApps);
      },
      error: (error) => {
        console.error('Error al obtener datos:', error);
      },
    });
  }
}
