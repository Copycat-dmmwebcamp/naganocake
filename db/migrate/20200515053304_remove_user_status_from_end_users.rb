class RemoveUserStatusFromEndUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :end_users, :user_status, :boolean
  end
end
