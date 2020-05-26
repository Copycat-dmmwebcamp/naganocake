class RemoveEndUsersFromOrders < ActiveRecord::Migration[5.2]
  def change
    #remove_reference :orders, :end_users, foreign_key: true
  end
end
