import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    type: String,
  };

  connect() {
    console.log("connecté au modal controller");
    this.modal = new bootstrap.Modal(this.element);
    addEventListener("turbo:submit-end", (event) => {
      if (event.detail.success) {
        this.modal.hide();
      } else if (event.detail.success === false) {
        this.triger();
      }
    });
  }

  triger() {
    if (this.typeValue === "add") {
      addEventListener("hide.bs.modal", (event) => {
        this.element.querySelectorAll(".form-control").forEach((el) => {
          el.classList.remove("is-invalid");
          el.classList.remove("is-valid");
          el.value = "";
        });
        this.element.querySelector(".alert")?.remove();
      });
    }
  }
}
