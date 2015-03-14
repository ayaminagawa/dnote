class AddCategoryNumber5ToCategorySelects < ActiveRecord::Migration
  def change
    add_column :category_selects, :category_number5, :integer
  end
end
