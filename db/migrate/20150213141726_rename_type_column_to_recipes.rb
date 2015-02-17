class RenameTypeColumnToRecipes < ActiveRecord::Migration
  def change
  	rename_column :recipes, :type, :kind
  end
end
