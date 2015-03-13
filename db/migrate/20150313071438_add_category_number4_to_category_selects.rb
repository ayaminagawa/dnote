class AddCategoryNumber4ToCategorySelects < ActiveRecord::Migration
  def change
    add_column :category_selects, :category_number4, :integer
  end
end
