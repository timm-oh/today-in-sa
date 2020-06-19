import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]

  show(){
    this.contentTarget.classList.remove('is-hidden')
  }

  hide() {
    this.contentTarget.classList.add('is-hidden')
  }

}
