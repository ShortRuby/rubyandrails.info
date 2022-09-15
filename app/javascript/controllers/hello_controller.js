import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
	console.log("asdf")
    this.element.textContent = "Hello World!asfd"
  }
}
