class AddSugarToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :sugar, :integer
  end
end
