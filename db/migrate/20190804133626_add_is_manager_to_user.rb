class AddIsManagerToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_manager, :boolean
  end
end
