
class User < ActiveRecord::Base
  has_many(:feeds)
  has_many(:qvipps, through: :feeds)

  validate :email?
  # validates :email, confirmation: true
  # validates(:email, {:presence => true, :has_char => '@'})
  # validates :email, inclusion: { in: %w(@), message: "%{value} is not a valid email" }


  def email?
    if (self.email.include?('@') == false)
      errors.add(:email, "That's no email foo!")
    end
  end

end
