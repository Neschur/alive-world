class WorldUpdaterChannel < ApplicationCable::Channel
  def subscribed
    stream_from "world_updater"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
