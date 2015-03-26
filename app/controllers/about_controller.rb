class AboutController < ApplicationController
  def index
  	@favorite_recipes = Favorite.favorite_count.map{|recipe_id| Recipe.find_by(id: recipe_id)}
  	@todays_menu = Menu.find(:last)
  	@menu_recipes = MenuRecipe.where(menu_id: @todays_menu) 
  	@recipes = @menu_recipes.map{|menu_recipe| menu_recipe.recipe}
  	@nurtrition_menu = Menu.find(3)

  	require "date"

  	@d = Date.today
  end
end
