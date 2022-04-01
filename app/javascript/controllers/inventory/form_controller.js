import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inventory--form"
export default class extends Controller {
  static targets = ["quantity", "currentQuantity"]

  initialize() {
    this.updated = false

    if (this.currentQuantityTarget.value !== "" && this.quantityTarget.value !== this.currentQuantityTarget.value) {
      this.updated = true
    }
  }

  quantityIsUpdated(event) {
    if (!this.updated) {
      this.currentQuantityTarget.value = event.target.value
    }
  }

  currentQuantityIsUpdated(event) {
    this.updated = true
  }
}

