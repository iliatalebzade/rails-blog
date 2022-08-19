import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // variables
  mobileNavLinks = document.querySelector("#mobileNavLinks")
  toggleBtn = document.querySelector("#burgerBtn")
  isOpen = false

  // methods
  toggleNavbar() {
    this.mobileNavLinks.classList.toggle("hidden")
  }
}