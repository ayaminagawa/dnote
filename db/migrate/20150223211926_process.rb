class Processes < ActiveRecord::Migration
  def change
  	crate_table :processes do |t|
  		t.column :recipe_id, :integer
  		t.column :body, :string
  		t.column :image, :string
	end
  end
end
