class AddRoleToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :role, :integer, :default => "customer"
  end
end
