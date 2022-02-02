module ApplicationHelper
  def users_online
    User.online
  end
end
