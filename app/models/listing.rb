class Listing < ApplicationRecord
	paginates_per 10
	belongs_to :user
	mount_uploaders :images, AvatarUploader
	# belongs_to :booking
	has_many :listings_tags
    has_many :tags, through: :listings_tags
end
