class Listing < ApplicationRecord
	paginates_per 10
	belongs_to :user
	mount_uploaders :images, AvatarUploader
	has_many :bookings
	has_many :listings_tags
    has_many :tags, through: :listings_tags

    scope :city, -> (city) { where("city ILIKE ?", "%#{city}%") }

end
