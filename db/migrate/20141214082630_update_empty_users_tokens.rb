class UpdateEmptyUsersTokens < ActiveRecord::Migration
  def up
    users = User.where(token: nil)
    users.find_each do |u|
      u.update_column(:token, SecureRandom.hex(10))
    end
  end

  def down

  end
end
