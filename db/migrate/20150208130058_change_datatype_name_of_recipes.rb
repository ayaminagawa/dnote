class ChangeDatatypeNameOfRecipes < ActiveRecord::Migration
  def change
  	change_column(:recipes, :name, :string)
  end
end
