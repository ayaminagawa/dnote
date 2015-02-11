class AddColumnRecipes < ActiveRecord::Migration
  def change
  	add_column(:recipes, :tip, :text)
  	add_column(:recipes, :comment, :text)
  end
end
