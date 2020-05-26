class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :end_users, foreign_key: true
      t.integer :payment_info
      t.string :destination
      t.string :delivery_address
      t.string :postal_code
      t.integer :order_status
      t.integer :postage
      t.integer :billing_amount
      t.timestamps
    end
  end
end
