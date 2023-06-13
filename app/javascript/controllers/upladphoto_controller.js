import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upladphoto"
export default class extends Controller {

  static targets = ["image", "upload"]

  connect() {
    console.log(this.imageTarget, this.uploadTarget)
  }

  display(event) {
    const input = event.target
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = (event) => {
        this.imageTarget.src = event.currentTarget.result;
      }
      reader.readAsDataURL(input.files[0])
      this.imageTarget.classList.remove('hidden');
  }
}
}
