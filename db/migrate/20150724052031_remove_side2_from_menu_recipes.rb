class RemoveSide2FromMenuRecipes < ActiveRecord::Migration
  def up
    remove_column :menu_recipes, :side2, :integer
  end

  def down
    add_column :menu_recipes, :side2, :integer
  end
end
