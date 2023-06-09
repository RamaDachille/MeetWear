import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating.js"

// Connects to data-controller="star-rating"
export default class extends Controller {
  connect() {
    this.stars = new StarRating(this.element, {tooltip: false})

  }
}
