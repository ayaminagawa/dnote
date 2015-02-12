class AddFavoriteNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :favorite_number, :integer
  end
end
