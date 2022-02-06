class User < ApplicationRecord
  has_many :messages, dependent: :destroy

  before_create :generate_nickname

  scope :online, -> { where(online: true) }

  def still_connected?
    status =
      UsersOnlineChannel.broadcast_to(self, action: 'presence-check')

    return true if status.is_a?(Integer) && status.positive?

    false
  end

  private

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end
end
