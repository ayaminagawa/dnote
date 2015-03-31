class AddPermissionToNutritionists < ActiveRecord::Migration
  def change
    add_column :nutritionists, :permission, :integer
  end
end
