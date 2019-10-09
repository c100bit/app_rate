import consumer from "./consumer"

class RateChannel {

  constructor(options = {}) {
    consumer.subscriptions.create("RateChannel", {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        options['received'](data)
      }
    });
  }
}


export default RateChannel