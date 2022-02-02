class UsersOnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'users_online_channel'
    current_user.update(is_online: true)
    speak
  end

  def unsubscribed
    current_user.update(is_online: false)
    speak
  end

  def speak
    ActionCable.server.broadcast('users_online_channel', { object: User.online })
  end
end
