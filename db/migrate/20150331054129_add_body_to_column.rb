class AddBodyToColumn < ActiveRecord::Migration
  def change
    add_column :columns, :body, :string
  end
end
