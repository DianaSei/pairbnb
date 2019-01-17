class ReservationMailer < ApplicationMailer
	def booking_email (host, customer, reservation_id)
		@host = host
		@customer = customer
		# @url = 'http://localhost:3000/listings/<%= reservation_id %>'
		
		mail(to: @host.email, subject: 'You Have a New Booking!')
	end
end
