class User < ActiveRecord::Base
  has_and_belongs_to_many(:qvipps)
  # validates(:email, {:presence => true, :has_char => '@'})
end
