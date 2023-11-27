import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { WebApps } from '../../interfaces/apps';

@Injectable({
  providedIn: 'root',
})
export class SesionService {
  private url = environment.backUrl + '/webApps';

  constructor(private http: HttpClient) {}

  getWebApps(): Observable<WebApps[]> {
    return this.http.get<WebApps[]>(this.url);
  }
}
