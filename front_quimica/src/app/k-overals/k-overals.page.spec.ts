import { ComponentFixture, TestBed } from '@angular/core/testing';
import { KOveralsPage } from './k-overals.page';

describe('KOveralsPage', () => {
  let component: KOveralsPage;
  let fixture: ComponentFixture<KOveralsPage>;

  beforeEach(async(() => {
    fixture = TestBed.createComponent(KOveralsPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
