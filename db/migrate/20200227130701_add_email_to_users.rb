class AddEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    # SQLite bug https://stackoverflow.com/a/6710280
    add_column :users, :email, :string
    change_column :users, :email, :string, null: false
  end
end
