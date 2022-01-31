class RoomChannel < ApplicationCable::Channel
  def subscribed
    logger.info "Subscribed to RoomChannel"
    stream_from "room_channel"
  end

  def unsubscribed
    logger.info "Unsubscribed to RoomChannel"
  end

  def speak
  end
end
