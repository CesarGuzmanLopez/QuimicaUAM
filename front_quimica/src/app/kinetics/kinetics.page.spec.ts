import { ComponentFixture, TestBed } from '@angular/core/testing';
import { KineticsPage } from './kinetics.page';

describe('KineticsPage', () => {
  let component: KineticsPage;
  let fixture: ComponentFixture<KineticsPage>;

  beforeEach(async(() => {
    fixture = TestBed.createComponent(KineticsPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
