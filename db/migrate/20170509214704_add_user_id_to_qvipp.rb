class AddUserIdToQvipp < ActiveRecord::Migration[5.1]
  def change
    add_column(:qvipps, :user_id, :integer)
  end
end
