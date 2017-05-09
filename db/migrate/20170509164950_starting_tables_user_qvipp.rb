class StartingTablesUserQvipp < ActiveRecord::Migration[5.1]
  def change

    create_table(:users) do |t|
      t.column(:name, :text)
      t.column(:email, :text)
      t.column(:bio, :text)
    end

    create_table(:qvinns) do |t|
      t.column(:follower, :integer)
      t.column(:followee, :integer)
    end

    create_table(:qvipps) do |t|
      t.column(:haiku, :text)
    end

  end
end
