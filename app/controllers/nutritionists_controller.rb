class NutritionistsController < ApplicationController
  def show
    @id = params[:id]
    @nutritionist = Nutritionist.find(@id)
    @columns = Column.where(:nutritionist_id => current_nutritionist.id)
  end

  def mypage
    @nutritionist = current_nutritionist
    @columns = Column.where(:nutritionist_id => current_nutritionist.id)
  end
end
