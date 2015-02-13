class AddTypeToRecipe < ActiveRecord::Migration
  def change
  	add_column :recipes, :kind, :integer
  end
end
