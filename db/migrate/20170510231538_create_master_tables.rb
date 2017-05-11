class CreateMasterTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:users) do |t|
      t.column(:name, :text)
      t.column(:email, :text)
      t.column(:bio, :text)
    end

    create_table(:feeds) do |t|
      t.column(:user_id, :integer)
      t.column(:qvipp_id, :integer)
      t.column(:junk, :text)
    end

    create_table(:qvipps) do |t|
      t.column(:haiku, :text)
      t.column(:original_user, :text)
    end
  end
end
