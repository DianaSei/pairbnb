class ReservationMailer < ApplicationMailer
	def booking_email (host, customer)
		@host = host
		@customer = customer
		@url = 'http://localhost:3000/'
		
		mail(to: @host.email, subject: 'You Have a New Booking!')
	end
end
