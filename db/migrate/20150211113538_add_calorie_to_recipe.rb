class AddCalorieToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :calorie, :integer
  end
end
