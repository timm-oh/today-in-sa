import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "location", "output", "hash" ]

  connect() {
    this.refresh = this._refresh.bind(this)
    this.locationTarget.addEventListener('change', this.refresh, false)
    this.hash = JSON.parse(this.hashTarget.innerText)
    this.refresh()
  }

  disconnect() {
    this.locationTarget.removeEventListener('change', this.refresh)
  }

  _refresh(event) {
    this.outputTarget.innerText = this.hash[this.locationTarget.value]
  }

}
