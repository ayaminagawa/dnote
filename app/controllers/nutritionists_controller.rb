class NutritionistsController < ApplicationController
  def show
    @columns = Column.where(:nutritionist_id => current_nutritionist.id)
  end

  def mypage
    @nutritionist = current_nutritionist
    @columns = Column.where(:nutritionist_id => current_nutritionist.id)
  end
end
