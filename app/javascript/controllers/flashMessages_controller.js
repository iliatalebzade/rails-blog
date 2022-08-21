import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-messages"
export default class extends Controller {
  toggleBtn = document.querySelector("#alertFlashMassage")

  clicked() {
    this.toggleBtn.classList.add("hidden")
  }
}
