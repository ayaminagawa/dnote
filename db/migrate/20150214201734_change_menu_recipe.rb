class ChangeMenuRecipe < ActiveRecord::Migration
  def change
  	add_index :menu_recipes, [:recipe_id, :menu_id], unique: true
  end
end
