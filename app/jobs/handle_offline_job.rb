class HandleOfflineJob < ApplicationJob
  queue_as :critical

  def perform(user)
    return if user.still_connected?

    UserStatus.make_offline(user)
  end
end
