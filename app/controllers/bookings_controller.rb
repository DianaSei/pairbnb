class BookingsController < ApplicationController
	def new
		@listing = Listing.find(params[:listing_id])
	end

	def create
		@listing = Listing.find(params[:listing_id])
		booking = Booking.new(booking_params)
		booking.user_id = current_user.id
		booking.listing_id = @listing.id
		if booking.save
			ReservationJob.perform_later(booking.listing.user, booking.user)
			redirect_to root_path
			flash[:success] = "You have made a booking "
		else redirect_to new_listing_booking_path
			flash[:warning] = "Your booking was not saved, try to change the dates "
		end
	end

	def index
		@bookings = Booking.where(:user_id => current_user.id).order(updated_at: :desc)
		
	end

	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy 
		redirect_to listing_bookings_path
	end

	private

	def booking_params
		params.require(:booking).permit(
			:start_from,
			:end_on
			)
	end
end
