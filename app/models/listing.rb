class Listing < ApplicationRecord
	paginates_per 10
	belongs_to :user
	mount_uploaders :images, AvatarUploader
	has_many :bookings
	has_many :listings_tags
    has_many :tags, through: :listings_tags

    scope :city, -> (city) { where("city ILIKE ?", "%#{city}%") }

 #    def self.search_city(query)
	#     cities = where("city ILIKE ?", "%#{query}%").map do |record|
	#       record.city 
	#     end
	#     cities.uniq
	# end


end
