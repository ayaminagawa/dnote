class RenameCategoryNumberToCategoryNumber1 < ActiveRecord::Migration
  def change
  	rename_column :Category_selects, :category_number, :categoru_number1
  	
  end
end
