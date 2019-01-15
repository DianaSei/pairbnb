# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# tags = ['Non-smoking', 'No pets', 'Late-coder', 'Whole apartment', 'One room']

# tags.each do |name|
# 	tag = Tag.create(name: name)
# end

# Seed Users
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['full_name'] = Faker::Name.name 
    user['email'] = Faker::Internet.unique.email
    user['avatar'] = Faker::File.file_name('path/to')
    
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['name_of_the_building'] = Faker::App.name
   
    listing['address'] = Faker::Address.street_address

    listing['details'] = Faker::Hipster.sentence
    listing['price'] = rand(80..500)

    listing['user_id'] = uids.sample

    new_listing = Listing.create(listing)
    
  end
end

