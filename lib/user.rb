class User < ActiveRecord::Base
  has_many(:qvipps)
end
