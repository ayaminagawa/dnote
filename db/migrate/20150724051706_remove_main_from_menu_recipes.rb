class RemoveMainFromMenuRecipes < ActiveRecord::Migration
  def up
    remove_column :menu_recipes, :main, :integer
  end

  def down
    add_column :menu_recipes, :main, :integer
  end
end
