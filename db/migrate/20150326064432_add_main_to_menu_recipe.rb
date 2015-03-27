class AddMainToMenuRecipe < ActiveRecord::Migration
  def change
    add_column :menu_recipes, :main, :integer
  end
end
