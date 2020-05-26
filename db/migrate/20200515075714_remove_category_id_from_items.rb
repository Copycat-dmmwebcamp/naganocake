class RemoveCategoryIdFromItems < ActiveRecord::Migration[5.2]
  def change
    #remove_reference :items, :category_id, foreign_key: true
  end
end
