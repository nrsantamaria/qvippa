
class User < ActiveRecord::Base
  has_many(:feeds)
  has_many(:qvipps, through: :feeds)
  # validates(:email, {:presence => true, :has_char => '@'})
end
