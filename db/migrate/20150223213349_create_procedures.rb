class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|

      t.integer :recipe_id
      t.string :body
      t.string :image

      t.timestamps
    end
  end
end
