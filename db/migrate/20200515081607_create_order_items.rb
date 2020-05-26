class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      #t.references :order, foreign_key: true
      t.integer :order_id
      t.references :item, foreign_key: true
      t.integer :production_status
      t.integer :unit_price
      t.integer :item_number
      t.timestamps
    end
  end
end
