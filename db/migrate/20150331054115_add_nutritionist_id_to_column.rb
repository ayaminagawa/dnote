class AddNutritionistIdToColumn < ActiveRecord::Migration
  def change
    add_column :columns, :nutritionist_id, :string
  end
end
