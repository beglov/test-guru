class CreateTestPassageBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passage_badges do |t|
      t.references :test_passage, foreign_key: true
      t.references :badge, foreign_key: true

      t.timestamps
    end
  end
end
