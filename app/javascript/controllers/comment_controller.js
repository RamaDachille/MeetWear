import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment"
export default class extends Controller {
  static targets= ["form", "btn"]
  connect() {
  }

  toogle() {
    this.btnTarget.classList.add('d-none');
    this.formTarget.classList.remove('d-none');
  }
}
