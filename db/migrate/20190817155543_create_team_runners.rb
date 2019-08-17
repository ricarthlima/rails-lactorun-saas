class CreateTeamRunners < ActiveRecord::Migration[5.2]
  def change
    create_table :team_runners, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid, :dependent => :destroy
      t.references :team, foreign_key: true, type: :uuid, :dependent => :destroy

      t.timestamps
    end
  end
end
