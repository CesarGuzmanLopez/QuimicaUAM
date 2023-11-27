import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Molecule } from '../../interfaces/Molecule';

@Injectable({
  providedIn: 'root',
})
export class MoleculesService {
  private url = environment.backUrl + '/kinetics';
  constructor(private http: HttpClient) {}
  getMolecules(): Observable<Molecule[]> {
    return this.http.get<Molecule[]>(this.url + '/molecules');
  }
}
