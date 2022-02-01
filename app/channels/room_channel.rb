class RoomChannel < ApplicationCable::Channel
  def subscribed
    logger.info "Subscribed to RoomChannel, roomId: #{params[:roomId]}"

    @room = Room.find(params[:roomId])
    
    stream_from "room_channel_#{@room.id}"

    speak('message' => '* * * присоединился к комнате * * *')
  end

  def unsubscribed
    logger.info 'Unsubscribed from RoomChannel'
  
    speak('message' => '* * * кокинул комнату  * * *')
  end

  def speak(data)
    logger.info "Speak: #{data.inspect}"

    MessageService.new(
      body: data['message'],
      room: @room,
      user: current_user
    ).perform
  end
end
