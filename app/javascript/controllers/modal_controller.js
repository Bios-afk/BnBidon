import { Controller } from "@hotwired/stimulus"
import {Modal} from "bootstrap"

export default class extends Controller {
  connect() {
    window.addEventListener("modal:close", () => {
      const modalElement = document.getElementById("flatModal")
      const modal = bootstrap.Modal.getInstance(modalElement)
      if (modal) modal.hide()
    })
  }
}
