class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, :author_id
    add_index :gists, :github_id
  end
end
