import { Component, Input, OnInit } from '@angular/core';
import { ModalController } from '@ionic/angular';

@Component({
  selector: 'app-modal-ris',
  templateUrl: './modal-ris.component.html',
  styleUrls: ['./modal-ris.component.scss'],
})
export class ModalRisComponent implements OnInit {
  @Input() ris!: string;

  constructor(private modalController: ModalController) {}

  closeModal() {
    this.modalController.dismiss();
  }

  ngOnInit() {}
}
