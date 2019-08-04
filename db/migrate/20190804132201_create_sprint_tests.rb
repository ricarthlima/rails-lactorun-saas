class CreateSprintTests < ActiveRecord::Migration[5.2]
  def change
    create_table :sprint_tests, id: :uuid do |t|
      t.references :lactate_test, foreign_key: true, type: :uuid
      t.integer :order
      t.float :distance
      t.float :time

      t.timestamps
    end
  end
end
