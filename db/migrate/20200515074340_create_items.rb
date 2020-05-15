class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :category_id, foreign_key: true
      t.string :item_name
      t.string :without_tax
      t.string :item_image
      t.text :item_explanation
      t.integer :item_status
      t.boolean :recomend, default: true, null: false
      t.timestamps
    end
  end
end
