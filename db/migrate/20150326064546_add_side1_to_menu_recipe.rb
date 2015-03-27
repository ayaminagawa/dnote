class AddSide1ToMenuRecipe < ActiveRecord::Migration
  def change
    add_column :menu_recipes, :side1, :integer
  end
end
