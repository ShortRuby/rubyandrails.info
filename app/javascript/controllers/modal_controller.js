import { Controller } from "stimulus"

export default class extends Controller {

  close() {
    this.element.remove()
    this.modalTurboFrame.src = null
  }
  
  escClose(event) {
    if (event.key === 'Escape') this.close()
  }

  get modalTurboFrame() {
    return document.querySelector("turbo-frame[id='modal']")
  }
}
