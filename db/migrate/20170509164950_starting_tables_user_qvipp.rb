class StartingTablesUserQvipp < ActiveRecord::Migration[5.1]
  def change

    create_table(:users) do |t|
      t.column(:name, :text)
      t.column(:email, :text)
      t.column(:bio, :text)
    end

    create_table(:qvipps_users) do |t|
      t.column(:user_id, :integer)
      t.column(:qvipp_id, :integer)
    end

    create_table(:qvipps) do |t|
      t.column(:haiku, :text)
    end

  end
end
