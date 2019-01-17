class WelcomeController < ApplicationController

	def index

		@bookings = Booking.where(:user_id => current_user.id)
		
		if signed_in?
			@name = "#{current_user.full_name}"
		else 
			@name = "Guest"
		end


	end



end
