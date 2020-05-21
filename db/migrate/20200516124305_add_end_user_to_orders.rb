class AddEndUserToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :end_user, foreign_key: true
	end
end
