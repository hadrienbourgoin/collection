import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["form_collec", "form_item"]

  connect() {
    console.log("coucou");
  }

  toggle_collec() {
    this.form_collecTarget.classList.toggle("d-none");
  }

  toggle_item() {
    this.form_itemTarget.classList.toggle("d-none");
  }
}
