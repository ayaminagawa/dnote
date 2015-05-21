# 使用するモデルファイル(test)を読み込む
require "#{Rails.root}/app/models/menu_recipe"

class Tasks::SubrecipeTask
  def self.execute
    menu_recipes = MenuRecipe.all
    menu_recipes.each do |menu_recipe|

      if menu_recipe.side1 == menu_recipe.side2
        menu_recipe.update(side2: nil)
      end

      if menu_recipe.main
        menu_recipe.recipe_id = menu_recipe.main
        menu_recipe.save
      end

      if menu_recipe.side1
        menu_recipe1 = MenuRecipe.new
        menu_recipe1.menu_id = menu_recipe.menu_id
        menu_recipe1.recipe_id = menu_recipe.side1
        menu_recipe1.save
      end

      if menu_recipe.side2
        menu_recipe2 = MenuRecipe.new
        menu_recipe2.menu_id = menu_recipe.menu_id
        menu_recipe2.recipe_id = menu_recipe.side2
        menu_recipe2.save
      end

    end
  end
end