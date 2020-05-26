class AddEndUserIdToOrders < ActiveRecord::Migration[5.2]
  def change
    #add_reference :orders, :end_user_id, foreign_key: true
  end
end
