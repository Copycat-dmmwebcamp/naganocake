class RemoveEndUserIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    #remove_reference :orders, :end_user_id, foreign_key: true
  end
end
