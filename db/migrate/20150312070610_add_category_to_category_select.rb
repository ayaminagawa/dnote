class AddCategoryToCategorySelect < ActiveRecord::Migration
  def change
    add_column :category_selects, :category, :integer
  end
end
