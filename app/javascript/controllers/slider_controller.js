import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {

  static targets = ["share", "ask", "glider", "shareInput", "askInput", "cards"]

  connect() {
    console.log(this.shareInputTarget.checked, this.askInputTarget.checked)
  }

  toggle(event) {
    event.preventDefault()
    this.shareTarget.classList.toggle("share-text")
    this.askTarget.classList.toggle("ask-text")
    this.gliderTarget.classList.toggle("share-glider")
    this.gliderTarget.classList.toggle("ask-glider")
    if (this.shareInputTarget.hasAttribute("checked")) {
      this.shareInputTarget.removeAttribute("checked")
      this.askInputTarget.setAttribute("checked", "")
    }  else {
      this.shareInputTarget.setAttribute("checked", "")
      this.askInputTarget.removeAttribute("checked")
    }
  }

  loadCards() {
    let url = window.location.origin
    if (this.askInputTarget.hasAttribute("checked")) {
      url = `${url}/ask-feed`
    }
    console.log(url)
    fetch(url, { headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.cardsTarget.innerHTML = data
      })
  }
}
