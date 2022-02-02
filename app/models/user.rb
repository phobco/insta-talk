class User < ApplicationRecord
  before_create :generate_nickname

  scope :online, -> { where(is_online: true) }

  private

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end
end
