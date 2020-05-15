class AddCategoryStatusToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :category_status, :boolean, default: true, null: false
  end
end
