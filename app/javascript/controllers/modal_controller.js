import { Controller } from "@hotwired/stimulus";
// import { Modal } from "bootstrap"

export default class extends Controller {
  connect() {
    console.log("connecté au modal controller");
    this.modal = new bootstrap.Modal(this.element);
    console.log(this.modal);
    addEventListener("turbo:before-stream-render", (event) => {
      this.modal.hide();
    });
  }
}
