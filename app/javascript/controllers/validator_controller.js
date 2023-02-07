import { Controller } from "@hotwired/stimulus";
import Inputmask from "inputmask";

// Connects to data-controller="validator"
export default class extends Controller {
  static targets = ["phonenumber"];

  phoneMask() {
    Inputmask({
      regex: "[0-9]{3}-[0-9]{3}-[0-9]{4}",
    }).mask(this.phonenumberTarget);
  }
}
