class AddColumnsNutritionist < ActiveRecord::Migration
  def change
  	add_column :nutritionists, :name, :string
  	add_column :nutritionists, :description, :string
  end
end
