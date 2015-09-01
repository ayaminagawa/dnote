class AddColumnsToFoodInfos < ActiveRecord::Migration
  def change
    add_column :food_infos, :unit, :string
    add_column :food_infos, :weight, :float
  end
end
