class AboutController < ApplicationController
  def index
  	@favorite_recipes = Favorite.favorite_count.map{|recipe_id| Recipe.find_by(id: recipe_id)}
  	@todays_menu = Menu.find(:last)

  	@menu_recipe = MenuRecipe.find_by(menu_id: @todays_menu.id)

  	@main_recipe = Recipe.find(@menu_recipe.main)
    @side1_recipe = Recipe.find(@menu_recipe.side1)
    @side2_recipe = Recipe.find(@menu_recipe.side2)
    # @main_recipe = @main_recipes.first
    # @side1_recipe = @side1_recipes.first
    # @side2_recipe = @side2_recipes.first
    @nurtrition_menu = Menu.find(3)

    @permission_columns = Column.where(permission: 1)
    @column = @permission_columns.find(:last)


    require "date"

    @d = Date.today
  end
end
