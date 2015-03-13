class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :recipe_id
      t.integer :menu_id
      t.integer :category_number

      t.timestamps
    end
  end
end
