class AddPresavesToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :pre_save, :integer
  end
end
