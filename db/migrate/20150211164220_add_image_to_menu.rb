class AddImageToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :image, :string
  end
end
