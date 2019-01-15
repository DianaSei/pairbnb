class BookingsController < ApplicationController
	def new
	end

	def create
		booking = Booking.new(booking_params)
		booking.user_id = current_user.id
		booking.listing_id = 
		if booking.save
			redirect_to listings_path
		else redirect_to new_listing_booking_path
		end
	end

	private

	def booking_params
		params.require(:booking).permit(
			:start_from,
			:end_on
			)
	end
end
