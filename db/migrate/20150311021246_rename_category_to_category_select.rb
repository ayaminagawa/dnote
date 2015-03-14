class RenameCategoryToCategorySelect < ActiveRecord::Migration
  def change
    rename_table :categories, :category_selects 
  end
end
