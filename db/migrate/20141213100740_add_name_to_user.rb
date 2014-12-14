class AddNameToUser < ActiveRecord::Migration
  def up
  	add_column :users, :firstname, :string
  	add_column :users, :lastname, :string
  end

  def down
  	remove_column :users, :firstname
  	remove_column :users, :lastname
  end
end
