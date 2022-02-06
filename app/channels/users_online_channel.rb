class UsersOnlineChannel < ApplicationCable::Channel
  after_unsubscribe :handle_offline

  def subscribed
    stream_from 'users_online_channel'
    stream_for current_user

    UserStatus.make_online(current_user)
  end

  def unsubscribed; end

  private

  def handle_offline
    HandleOfflineJob.
    set(wait_until: Time.zone.now + 5).
    perform_later(current_user)
  end
end
