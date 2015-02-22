class AboutController < ApplicationController
  def index
  	@recipe = Recipe.find(1)
  	@favorite_recipes = Favorite.favorite_count.map{|recipe_id| Recipe.find_by(id: recipe_id)}
  end
end
