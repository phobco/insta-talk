import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log('Connected to RoomChannel')
  },

  disconnected() {
    console.log('Disonnected from RoomChannel')
  },

  received(data) {
    console.log(data)
  },

  speak: function() {
    return this.perform('speak');
  }
});
