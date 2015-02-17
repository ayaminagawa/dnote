class CreateFavoriteMenus < ActiveRecord::Migration
  def change
    create_table :favorite_menus do |t|
      t.integer :user_id
      t.integer :menu_id

      t.timestamps
    end
  end
end
