class RemoveRecipeSelectFromUser < ActiveRecord::Migration
  def change
  	remove_columns(:users, :recipe_select)
  end
end
