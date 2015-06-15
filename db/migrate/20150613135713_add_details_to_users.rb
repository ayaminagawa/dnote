class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
  end
end
