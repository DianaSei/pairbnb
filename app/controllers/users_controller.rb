class UsersController < ApplicationController
	def create
		user = User.new(user_params) 
		if user.save 
			redirect_to '/'
		else 
			# by@rails ebug
			redirect_to '/sign_up'
		end
	end

	private
	def user_params
	    params.require(:user).permit(
	      :email, 
	      :password,  
	      :full_name 
	    )
  	end
end
