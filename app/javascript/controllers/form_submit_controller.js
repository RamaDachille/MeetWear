import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-submit"
export default class extends Controller {
  submit() {
    this.element.submit();
  }
}
