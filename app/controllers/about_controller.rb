class AboutController < ApplicationController
  def index
  	@recipe = Recipe.find(1) 
  end
end
