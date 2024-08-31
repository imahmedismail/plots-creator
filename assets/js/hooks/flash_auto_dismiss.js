export const FlashAutoDismiss = {
    mounted() {
        console.log("Hook called?")
      setTimeout(() => {
        this.el.remove()
      }, 5000) // 5000ms = 5 seconds, adjust as needed
    }
  }