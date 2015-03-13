class AddCategoryToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :category, :integer
  end
end
