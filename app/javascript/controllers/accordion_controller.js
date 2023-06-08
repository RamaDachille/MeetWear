import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {

  static targets = [ "accordion", "hiddenText", "hiddenTag" ]

  connect() {
    console.log("Hello from Hell")
    // this.openAccordion()
  }


  anotherAcordion(e){
    e.currentTarget.classList.add("d-none");
   this.hiddenTextTarget.classList.remove("d-none")
   this.hiddenTagTargets.forEach(element => {
      element.classList.remove("d-none")
   });

  }

}
