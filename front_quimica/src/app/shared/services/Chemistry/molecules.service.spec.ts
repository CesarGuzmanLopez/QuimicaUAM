import { TestBed } from '@angular/core/testing';

import { MoleculesService } from './molecules.service';

describe('MoleculesService', () => {
  let service: MoleculesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MoleculesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
