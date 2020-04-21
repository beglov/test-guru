class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :image_path
      t.integer :rule
      t.references :category, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
