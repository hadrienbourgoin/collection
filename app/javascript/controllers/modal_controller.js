import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['modal'];

  connect() {
  }

  open() {
    if (!this.modal.isOpened) {
      this.modal.open()
    }
  }

  close() {
    const modal = this.modalTarget;
    document.body.classList.remove("modal-open");
    modal.removeAttribute("style");
    modal.classList.remove("show");
    document.getElementsByClassName("modal-backdrop")[0].remove();
  }
}
