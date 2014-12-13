class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user, index: true
      t.datetime :date
      t.integer :value
      t.text :description
      t.integer :examination_type

      t.timestamps
    end
  end
end
