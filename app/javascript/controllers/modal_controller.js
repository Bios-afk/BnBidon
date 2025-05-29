import { Controller } from "@hotwired/stimulus";
// import { Modal } from "bootstrap"

export default class extends Controller {
  connect() {
    console.log("connecté au modal controller");
    this.modal = new bootstrap.Modal(this.element);
    console.log(this.modal);
    addEventListener("turbo:submit-end", (event) => {
      console.log(event);
      if (event.detail.success) {
        this.modal.hide();
      }
    });

    addEventListener("hide.bs.modal", (event) => {
      this.element.querySelectorAll(".is-invalid").forEach((el) => {
        el.classList.remove("is-invalid");
      });
      this.element.querySelector('.alert')?.remove();
    });
  }
}
