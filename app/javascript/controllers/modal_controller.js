import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['modal'];

  connect() {
  }

  // open() {
  //   const modal = this.modalTarget;
  //   document.body.classList.add("modal-open");
  //   modal.setAttribute("style", "display: block;");
  //   modal.classList.add("show");
  //   document.body.innerHTML += '<div class="modal-backdrop fade show"></div>';
  // }

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