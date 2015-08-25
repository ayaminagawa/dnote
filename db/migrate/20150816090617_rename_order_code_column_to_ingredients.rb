class RenameOrderCodeColumnToIngredients < ActiveRecord::Migration
  def change
    rename_column :ingredients, :order_code, :order
  end
end
