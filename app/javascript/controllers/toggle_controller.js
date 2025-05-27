import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("stimulus connecté")
  }

  toggle() {
    // On log pour vérifier si toggle est appelé et si formTarget est trouvé
    console.log("Toggle called");
    console.log(this.hasFormTarget);  // boolean true/false
    if (this.hasFormTarget) {
      this.formTarget.classList.toggle("d-none");
    } else {
      console.warn("formTarget not found!");
    }
  }
}
