class Procedure < ActiveRecord::Base
	 belongs_to :recipe, :class_name => "Recipe"
end
