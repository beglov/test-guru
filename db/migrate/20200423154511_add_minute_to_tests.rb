class AddMinuteToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :minute, :integer, default: 0
  end
end
