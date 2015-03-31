class AddTitleToColumn < ActiveRecord::Migration
  def change
    add_column :columns, :title, :string
  end
end
