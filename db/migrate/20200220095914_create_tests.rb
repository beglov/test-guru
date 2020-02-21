class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.belongs_to :category, foreign_key: true
      t.string :title, null: false
      t.integer :level, default: 0

      t.timestamps
    end
  end
end
