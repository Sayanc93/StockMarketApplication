class MarketUpdaterChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "market_updater"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
