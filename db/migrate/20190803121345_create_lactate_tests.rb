class CreateLactateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :lactate_tests, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.string :local
      t.float :latitude
      t.float :longitude
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
