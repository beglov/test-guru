class CreateTestsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tests, :users do |t|
      t.index :test_id
      t.index :user_id
    end
  end
end
