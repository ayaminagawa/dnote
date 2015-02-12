class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :recipe_id
      t.string :volume
      t.integer :order_code

      t.timestamps
    end
  end
end
