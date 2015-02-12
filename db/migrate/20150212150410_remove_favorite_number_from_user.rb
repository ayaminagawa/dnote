class RemoveFavoriteNumberFromUser < ActiveRecord::Migration
  def change
  	remove_columns(:users, :favorite_number)
  end
end
