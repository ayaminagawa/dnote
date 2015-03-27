class AboutController < ApplicationController
  def index
  	@favorite_recipes = Favorite.favorite_count.map{|recipe_id| Recipe.find_by(id: recipe_id)}
  	@todays_menu = Menu.find(:last)
  	@menu_recipe = MenuRecipe.where(menu_id: @todays_menu) 
  	@main_recipe = Recipe.find(@menu_recipe.map{|menu_recipe| menu_recipe.main})
    @side1_recipe = Recipe.find(@menu_recipe.map{|menu_recipe| menu_recipe.side1})
    @side2_recipe = Recipe.find(@menu_recipe.map{|menu_recipe| menu_recipe.side2})
    @main_recipe = @main_recipe.first
    @side1_recipe = @side1_recipe.first
    @side2_recipe = @side2_recipe.first
  	@nurtrition_menu = Menu.find(3)

  	require "date"

  	@d = Date.today
  end
end
