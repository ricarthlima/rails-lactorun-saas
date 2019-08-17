class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid, :dependent => :destroy
      t.string :name
      t.text :obs
      t.string :access_code

      t.timestamps
    end
  end
end
