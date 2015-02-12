class CreateMadeReports < ActiveRecord::Migration
  def change
    create_table :made_reports do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.string :image
      t.string :message

      t.timestamps
    end
  end
end
