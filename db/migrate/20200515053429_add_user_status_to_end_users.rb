class AddUserStatusToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :user_status, :boolean, default: true, null: false
  end
end
