class ListingsController < ApplicationController
	def new
	end
	def create
		listing = Listing.new(listing_params) 
		listing.user_id = current_user.id
		if listing.save 
			redirect_to listings_path
		else 
			redirect_to root_path
		end
	end

	def index
		@listings = Listing.all.order(updated_at: :desc)

	end

	def update
		list = Listing.find(params[:id])
		list.update(listing_params)
		list.save
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit 

	end

	def destroy
		list = Listing.find(params[:id])
		if list.destroy
			redirect_to listings_path
		else 
			redirect_to listing_path(list)
		end
	end

private
	def listing_params
		params.require(:listing).permit(
		  :name_of_the_building, 
		  :address,  
		  :details,
		  :price 
		)	
  	end

end
