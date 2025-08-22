class AddJtiToExistingUsers < ActiveRecord::Migration[8.0]
  def change
    User.all.each { |user| user.update_column(:jti, SecureRandom.uuid) }
    change_column_null :users, :jti, false
  end
end
