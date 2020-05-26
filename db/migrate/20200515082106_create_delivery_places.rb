class CreateDeliveryPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_places do |t|
      #t.references :user, foreign_key: true
      t.integer :end_user_id
      t.string :postal_code
      t.string :address
      t.string :destination
      t.timestamps
    end
  end
end
