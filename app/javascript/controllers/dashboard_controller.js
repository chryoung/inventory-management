import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["beforeLockDown", "beforeUnlockDown"]

  subtractDate(left, right) {
    return Math.floor((left - right) / 86400000)
  }

  connect() {
    console.log(beforeLockDownTarget)
    console.log(beforeUnlockDownTarget)
    let now = new Date()
    let beforeLockDownDate = new Date(beforeLockDownTarget.dataset.date)
    let beforeUnlockDownDate = new Date(beforeUnlockDownTarget.dataset.date)

    if (now > beforeLockDown && now < beforeUnlockDownDate) {
      this.beforeLockDown.innerHtml = "In lockdown :("
      this.beforeUnlockDown.innerHtml = `${subtractDate(beforeUnlockDownDate, now)} days to unlock down`
    } else if (now < beforeLockDown) {
      this.beforeLockDown.innerHtml = `${subtractDate(beforeLockDownDate, now)} days to lock down`
      this.beforeUnlockDown.innerHtml = `${subtractDate(beforeUnlockDownDate, now)} days to unlock down`
    } else {
      this.beforeLockDown.innerHtml = "You are now lock down free!"
      this.beforeUnlockDown.innerHtml = `${subtractDate(now, beforeUnlockDownDate)} days after unlock down`
    }
  }
}
