class AddSide2ToMenuRecipe < ActiveRecord::Migration
  def change
    add_column :menu_recipes, :side2, :integer
  end
end
