import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

// Connects to data-controller="ts--select"
export default class extends Controller {
  connect() {
    console.log("Connecting to")
    console.log(this.element)
    new TomSelect(this.element)
  }
}
