class NutritionistsController < ApplicationController
  def show
    @nutritionist = current_nutritionist
    @columns = Column.where(:nutritionist_id => current_nutritionist.id)
  end
end
