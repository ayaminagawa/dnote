class RemoveCommentFromRecipe < ActiveRecord::Migration
  def change
  	remove_column(:recipes, :comment)
  end
end
