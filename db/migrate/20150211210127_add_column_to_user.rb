class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :recipe_select, :integer
    add_column :users, :favorite_number, :integer
  end
end
