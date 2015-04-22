class AddPermissionToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :permission, :integer
  end
end
