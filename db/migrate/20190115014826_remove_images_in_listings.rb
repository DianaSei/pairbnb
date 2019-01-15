class RemoveImagesInListings < ActiveRecord::Migration[5.2]
  def change
  	remove_column :listings, :images
  end
end
