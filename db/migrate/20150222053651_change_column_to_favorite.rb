class ChangeColumnToFavorite < ActiveRecord::Migration
  def change
  	add_index :favorites, [:user_id, :recipe_id], unique: true
  end
end
