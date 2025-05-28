import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("stimulus connecté")
  }

  toggle() {
    this.formTarget.classList.toggle("d-none")

    // Si le formulaire est maintenant visible, scroller dessus
    if (!this.formTarget.classList.contains("d-none")) {
      setTimeout(() => {
        this.formTarget.scrollIntoView({ behavior: "smooth", block: "start" })
      }, 100) // délai court pour garantir que le DOM est bien à jour
    }
  }
}
