import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider-profile"
export default class extends Controller {
  static targets = ["share","ask","saved","glider"];

  connect() {
  }

  ask(e) {
    this.askTarget.classList.remove("d-none")
    this.shareTarget.classList.add("d-none")
    this.savedTarget.classList.add("d-none")

    this.gliderTarget.classList = "glider ask-glider"
    this.#colorLabels(e.target.nextSibling.nextSibling)

  }

  share(e) {
    this.askTarget.classList.add("d-none")
    this.shareTarget.classList.remove("d-none")
    this.savedTarget.classList.add("d-none")

    this.gliderTarget.classList = "glider share-glider"
    this.#colorLabels(e.target.nextSibling.nextSibling)


  }

  saved(e) {
    this.askTarget.classList.add("d-none")
    this.shareTarget.classList.add("d-none")
    this.savedTarget.classList.remove("d-none")

    this.gliderTarget.classList = "glider saved-glider"
    this.#colorLabels(e.target.nextSibling.nextSibling)


  }

  #colorLabels(l){
    document.querySelectorAll("#slider label").forEach(label => {
      label.style = 'color: grey';
    });
    l.style = 'color: white';
  }
}
