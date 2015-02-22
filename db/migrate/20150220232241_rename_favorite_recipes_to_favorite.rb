class RenameFavoriteRecipesToFavorite < ActiveRecord::Migration
  def change
  	 rename_table :favorite_recipes, :favorites #この行を追加！
  end
end
