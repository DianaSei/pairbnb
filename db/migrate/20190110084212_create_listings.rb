class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
    	t.string :name_of_the_building
    	t.string :address
    	t.string :details
    	t.integer :price

      t.timestamps
    end
  end
end
