class AboutController < ApplicationController
  def index
  	@favorite_recipes = Favorite.favorite_count.map{|recipe_id| Recipe.find_by(id: recipe_id)}
  	@todays_menu = Menu.find(:last)

  	@menu_recipe = MenuRecipe.find_by(menu_id: @todays_menu.id)

  	@todays_recipes = Recipe.find(@menu_recipe.recipe_id)
    # @main_recipe = @main_recipes.first
    # @side1_recipe = @side1_recipes.first
    # @side2_recipe = @side2_recipes.first
    @nurtrition_menu = Menu.find(18)
    @nutritionist = User.find(8)

    @permission_columns = Column.where(permission: 2)
    @column = @permission_columns.find(:last)

    if user_signed_in?
      @permission = current_user.permission
    end
    require "date"

    @d = Date.today
  end
end
