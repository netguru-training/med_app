class AddAcknowledgeToAlert < ActiveRecord::Migration
  def up
    add_column :alerts, :acknowledge, :boolean, default: false
  end

  def down
    remove_column :alerts, :acknowledge, :boolean
  end
end
