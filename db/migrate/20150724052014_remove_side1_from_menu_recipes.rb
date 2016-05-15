class RemoveSide1FromMenuRecipes < ActiveRecord::Migration
  def up
    remove_column :menu_recipes, :side1, :integer
  end

  def down
    add_column :menu_recipes, :side1, :integer
  end
end
