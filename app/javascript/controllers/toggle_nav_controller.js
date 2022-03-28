import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-nav"
export default class extends Controller {
  static targets = ["menu"];

  toggleMenu(event) {
    event.preventDefault();
    for (let target of this.menuTargets) {
      let classList = target.classList;
      if (classList.contains("hidden")) {
        classList.remove("hidden");
        classList.add("block");
      } else {
        classList.remove("block");
        classList.add("hidden");
      }
    }
  }
}
