class AddTypeToRecipe < ActiveRecord::Migration
  def change
  	add_column :recipes, :type, :integer
  end
end
