import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {
  static values = {
    id: Number
  }
  static targets = ["counter"]

  connect() {
  }

  liker(event) {
    const id = this.element.dataset.id
    const path = this.element.dataset.path
    const method = this.element.dataset.method
    console.log(this.element);
    const url = `${window.location.origin}/${path}/${id}/${method}`
    event.currentTarget.classList.toggle("fa-solid")
    event.currentTarget.classList.toggle("fa-regular")
    const num = +this.counterTarget.innerText
    this.counterTarget.innerText = (event.currentTarget.classList.contains("fa-solid") ? num + 1 : num - 1 )
    fetch(url)
  }
}
