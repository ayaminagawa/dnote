class Users::SessionsController < Devise::SessionsController

	def new
		render :layout => "preview_layout"
	end

	def create
		 render :layout => "preview_layout"
	end
end