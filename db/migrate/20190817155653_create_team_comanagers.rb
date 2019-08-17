class CreateTeamComanagers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_comanagers, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid, :dependent => :destroy
      t.references :team, foreign_key: true, type: :uuid, :dependent => :destroy

      t.timestamps
    end
  end
end
