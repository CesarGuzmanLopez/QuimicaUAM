import { ComponentFixture, TestBed } from '@angular/core/testing';
import { PksPage } from './pks.page';

describe('PksPage', () => {
  let component: PksPage;
  let fixture: ComponentFixture<PksPage>;

  beforeEach(async(() => {
    fixture = TestBed.createComponent(PksPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
