class WelcomeController < ApplicationController

	def index
		if signed_in?
			@name = "#{current_user.full_name}"
		else 
			@name = "Guest"
		end
	end



end
