class AddCategoryNumber3ToCategorySelects < ActiveRecord::Migration
  def change
    add_column :category_selects, :category_number3, :integer
  end
end
