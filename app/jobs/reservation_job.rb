class ReservationJob < ApplicationJob
  queue_as :default

  def perform(listing_user, booking_user)
   	ReservationMailer.booking_email(listing_user, booking_user).deliver_now
  end
end
