export const FlashAutoDismiss = {
  mounted() {
    this.scheduleRemoval();
  },
  updated() {
    this.scheduleRemoval();
  },
  scheduleRemoval() {
    setTimeout(() => {
      this.el.remove();
    }, 3000); // Removes the flash message after 5 seconds
  }
}