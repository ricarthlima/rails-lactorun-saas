class AddBdayToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bday, :date
  end
end
