class RemovePasswordFromEndUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :end_users, :password, :string
  end
end
