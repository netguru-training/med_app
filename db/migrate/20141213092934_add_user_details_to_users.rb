class AddUserDetailsToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :doctor, :boolean, default: false
  	add_column :users, :doctor_id, :integer, index: true

  end

  def down
  	remove_column :users, :doctor
  	remove_column :users, :doctror_id
  end
end
