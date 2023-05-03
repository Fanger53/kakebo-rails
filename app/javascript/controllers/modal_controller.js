import { Controller } from "stimulus";
import * as bootstrap from 'bootstrap';

export default class extends Controller {

  disconnect() {
    // this.modal = new bootstrap.Modal(this.element);
    const backdrop = document.getElementsByClassName('modal-backdrop');
    backdrop[0].style.display = 'none';

    const modal = document.querySelector('[data-modal]');
    bootstrap.Modal.getInstance(modal).hide();

    
    console.log('hola');
  }
}
