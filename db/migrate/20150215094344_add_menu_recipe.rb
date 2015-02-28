class AddMenuRecipe < ActiveRecord::Migration
  def change
  	add_column :menu_recipes, :select_flag, :integer
  end
end
