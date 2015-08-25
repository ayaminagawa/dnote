class AddOrderToProcedures < ActiveRecord::Migration
  def change
    add_column :procedures, :order, :integer
  end
end
