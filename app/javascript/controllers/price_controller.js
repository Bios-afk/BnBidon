import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate", "priceDisplay"]

  connect() {
    this.pricePerNight = parseFloat(this.priceDisplayTarget.dataset.price)
    this.updatePrice()
  }

  updatePrice() {
    const start = new Date(this.startDateTarget.value)
    const end = new Date(this.endDateTarget.value)

    if (!isNaN(start) && !isNaN(end) && end > start) {
      const diffDays = (end - start) / (1000 * 60 * 60 * 24)
      const total = diffDays * this.pricePerNight
      this.priceDisplayTarget.innerText = total.toFixed(2)
    } else {
      this.priceDisplayTarget.innerText = this.pricePerNight.toFixed(2)
    }
  }
}
