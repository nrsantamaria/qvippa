
class User < ActiveRecord::Base
  has_many(:feeds)
  has_many(:qvipps, through: :feeds)

  validate :email?

  def email?
    if !self.email.include?('@')
      errors.add(:email, "That's no email foo!")
    end
  end

end
