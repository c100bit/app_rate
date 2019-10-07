class RateChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rates"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
