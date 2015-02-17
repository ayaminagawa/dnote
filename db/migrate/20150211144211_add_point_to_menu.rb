class AddPointToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :point, :string
  end
end
