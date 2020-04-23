class AddSecondsToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :seconds, :integer
  end
end
