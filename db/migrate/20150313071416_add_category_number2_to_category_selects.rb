class AddCategoryNumber2ToCategorySelects < ActiveRecord::Migration
  def change
    add_column :category_selects, :category_number2, :integer
  end
end
