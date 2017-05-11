
class Feed < ActiveRecord::Base
  belongs_to(:user)
  belongs_to(:qvipp)

  #scope is a method
  scope(:find_feed, -> (q_id, u_id) do
    where({:qvipp_id => q_id, :user_id => u_id})
  end)

end
