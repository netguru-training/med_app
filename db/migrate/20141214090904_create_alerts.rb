class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.text :content
      t.integer :user_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
