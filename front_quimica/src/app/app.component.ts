import { Component } from '@angular/core';
import { SesionService } from './shared/services/session/sesion.service';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
})
export class AppComponent {
  constructor(private sesionService: SesionService) {}
}
