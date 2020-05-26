class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
     #t.references :user, foreign_key: true
     t.integer :end_user_id
     #t.references :item, foreign_key: true
     t.integer :item_id
     t.integer :item_number
      t.timestamps
    end
  end
end
