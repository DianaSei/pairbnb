class UsersController < ApplicationController
	def create
		user = User.new(user_params) 
		if user.save 
			redirect_to '/sign_in'
		else 
			# by@rails ebug
			redirect_to '/sign_up'
		end
	end

	def edit
		redirect_to '/sign_up'
	end

	private
	def user_params
	    params.require(:user).permit(
	      :email, 
	      :password,  
	      :full_name,
	      :avatar	    )
  	end
end
