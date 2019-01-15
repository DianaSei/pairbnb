class User < ApplicationRecord
  include Clearance::User

  has_many :authentications, dependent: :destroy
  has_many :listings
  enum role: [:customer, :moderator, :admin]
  has_many :bookings
  mount_uploader :avatar, AvatarUploader

  def google_token
  	x = self.authentications.find_by(provider: "google_oauth2")
  	return x.token unless x.nil?
  end

  def self.create_with_auth_and_hash(authentication, auth_hash)
	user = self.create!(
	full_name: auth_hash["info"]["name"],
	email: auth_hash["info"]["email"],
	password: SecureRandom.hex(10)
	   )
  user.remote_avatar_url = auth_hash['info']['image']
  user.save
	user.authentications << authentication
	return user
  end

  


end
