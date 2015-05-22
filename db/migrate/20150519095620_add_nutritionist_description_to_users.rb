class AddNutritionistDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nutritionist_description, :string
  end
end
