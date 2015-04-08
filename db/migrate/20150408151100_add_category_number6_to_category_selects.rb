class AddCategoryNumber6ToCategorySelects < ActiveRecord::Migration
  def change
    add_column :category_selects, :category_number6, :integer
  end
end
