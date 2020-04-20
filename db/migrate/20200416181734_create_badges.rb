class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :image_path
      t.integer :rule

      t.timestamps
    end
  end
end
