class Booking < ApplicationRecord
	belongs_to :listing
	belongs_to :user
	validates :start_from, presence: true
	validates :end_on, presence: true

	validate :check_overlapping_dates, on: :create
  	# without S for custom validation
  	validate :start_date, on: :create

  	def start_date
  		self.start_from > Date.today
  		self.errors.add(:overlapping_dates, 'The start date should be greater than today date')
  		# flash[:warning] = "Your booking was not saved, the starting date should be greater than today date"
  	end


	  def check_overlapping_dates
	    listing.bookings.each do |prev_booking|
	      if overlap?(self, prev_booking)
	        self.errors.add(:overlapping_dates, "The booking dates conflict with an existing booking")
	      end
	    end
	  end

	  def overlap?(current_booking, prev_booking)
	    (current_booking.start_from - prev_booking.end_on) * (prev_booking.start_from - current_booking.end_on) > 0
	  end
end
