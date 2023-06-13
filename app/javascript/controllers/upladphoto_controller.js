import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upladphoto"
export default class extends Controller {
  static targets = [ "output", "input", "forminput"]

  connect() {
    console.log(this.forminputTarget);
  }
  readURL(event) {
    this.forminputTarget.classList.add("d-none")
    const input = this.inputTarget
    const output = this.outputTarget
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = function () {
        output.src = reader.result
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
}
