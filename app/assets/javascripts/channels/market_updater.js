if (App.cable) {
  App.hashtag_counter = App.cable.subscriptions.create({
    channel: "MarketUpdaterChannel",
    user: gon.current_user
  }, {
    connected: function() {
      console.log('connected');
      // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      if (data.status == "market_updated") {
        location.reload();
      }
    }
  });
}
