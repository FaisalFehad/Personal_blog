class Follower < ActiveRecord::Base
  validates :email,    presence: true, uniqueness: true
  validates_format_of  :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :name,     presence: true
  validates :token,    presence: true

  before_validation :generate_token, on: :create

  private
  # tokens uniquely identify a membership for
  # the purposes of unsubscribing through an email's link
  def generate_token
    loop do
      self.token = SecureRandom.hex(64)
      break if Follower.where(token: token).empty?
    end
  end
end
