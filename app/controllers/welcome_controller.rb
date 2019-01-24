class WelcomeController < ApplicationController

	def index

		@listings = Listing.all.order(updated_at: :desc).page params[:page]

	end
end
