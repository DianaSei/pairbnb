class ListingsController < ApplicationController
	def new
		@tags = Tag.all
	end
	def create
		listing = Listing.new(listing_params) 
		listing.user_id = current_user.id
		# tags = Tag.all
		# tags.each do |tag|
		
		if listing.save 
			redirect_to listings_path
		else 
			redirect_to root_path, notice: "Your listing was not saved!"
		end
	end

	def index
		# @listings = Listing.all.order(updated_at: :desc).page params[:page]
		# @listings = Listing.all.order(:name_of_the_building).page params[:page]
		@listings = Listing.city(params[:city]).page params[:page] if params[:city].present?
		# @listings = @listings.where(smoking: false) if params[:smoking].present?
		# @listings = @listings.where(pets: true)

	end

	# def search_listings 
	# 	@listings = Listing.city(params[:city]).page params[:page] if params[:city].present?
	# end

	def update
		list = Listing.find(params[:id])
		list.update(listing_params)
		list.save
	end

	def show
		@listing = Listing.find(params[:id])
		@booking = Booking.find_by(:listing_id => @listing.id, :user_id => current_user.id)
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

	def verify
		listing = Listing.find(params[:id])

		if listing.verify == nil
			listing.update(verify: true)
		end
			redirect_to listing_path
	end

	def unverify
		listing = Listing.find(params[:id])
		if listing.verify == nil
			listing.update(verify: false)
		end
			redirect_to listing_path	
	end



private
	def listing_params
		params.require(:listing).permit(
		  :name_of_the_building, 
		  :address,  
		  :details,
		  :price, 
		  :city,
		  {images: []}
		)	
  	end

end
