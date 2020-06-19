import { Controller } from "stimulus"
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = [ "location", "output" ]

  connect() {
    this.refresh = this._refresh.bind(this)
    this.locationTarget.addEventListener('change', this.refresh, false)
  }

  get quotePath(){
    return this.data.get("quote-path")
  }

  disconnect() {
    this.locationTarget.removeEventListener('change', this.refresh)
  }

  _refresh(event) {
    this.locationTarget.parentElement.classList.toggle('is-loading')
    let payload = { "location": this.locationTarget.value }
    Rails.ajax({
      url: this.quotePath,
      type: 'POST',
      data: new URLSearchParams(payload).toString(),
      success: response => {
        this.locationTarget.parentElement.classList.toggle('is-loading')
        this.outputTarget.innerText = response.quote
      }
    });
  }
}
