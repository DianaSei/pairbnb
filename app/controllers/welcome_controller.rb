class WelcomeController < ApplicationController

	def index

		@listings = Listing.all.order(updated_at: :desc).page params[:page]

	end

	# def search
	#     @cities = Listing.search_city(params["query"])
	#     respond_to do |format|
	#       format.json { render json: @cities }
	#       format.js # remote: true is sent a js format and sends you to search.js.erb
 #    	end
 #    	# redirect_to listings_path
 #    end



end
