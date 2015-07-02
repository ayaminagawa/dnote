class CreateRecipeFeelings < ActiveRecord::Migration
  def change
    create_table :recipe_feelings do |t|
      t.integer :recipe_id
      t.integer :feeling

      t.timestamps
    end
  end
end
