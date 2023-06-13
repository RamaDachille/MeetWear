import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="postform"
export default class extends Controller {

  static targets = ["input", "container", "adam", "button"]

  connect() {
    console.log(this.inputTarget, this.containerTarget, this.adamTarget, this.buttonTarget)
    this.hashtagArray=[]
    this.preventForm()
    this.createTags()
  }


  createTags(){
    const hashtagArray = []

    this.inputTarget.addEventListener('keyup', (event) => {
      if (event.which == 13 &&  this.inputTarget.value.length > 0) {
        var text = document.createTextNode(this.inputTarget.value);
        var p = document.createElement('p');
        this.containerTarget.appendChild(p);
        p.appendChild(text);
        p.classList.add('tag');
        this.hashtagArray.push(this.inputTarget.value)
        this.inputTarget.value = '';
        console.log(this.hashtagArray)

        let deleteTags = document.querySelectorAll('.tag');

        for(let i = 0; i < deleteTags.length; i++) {
          deleteTags[i].addEventListener('click', () => {
            this.containerTarget.removeChild(deleteTags[i]);
          });
        }
      }
  });


  }


  preventForm(){
    this.adamTarget.onkeypress = function(e) {
      var key = e.charCode || e.keyCode || 0;
      if (key == 13) {

        e.preventDefault();
      }
    }
  }


  send(){


    this.buttonTarget.value =  this.hashtagArray
  }




}
