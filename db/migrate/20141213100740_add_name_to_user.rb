class AddNameToUser < ActiveRecord::Migration
  def up
  	add_column :users, :firstname, :string, null: false
  	add_column :users, :lastname, :string, null: false
  end

  def down
  	remove_column :users, :firstname
  	remove_column :users, :lastname
  end
end
