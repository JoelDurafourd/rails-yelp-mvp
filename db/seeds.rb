# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
# new_article = Article.new(title: 'The meaning of life', content: "It's 42!")

10.times do
  category = ["chinese", "italian", "japanese", "french", "belgian"].sample
  new_restaurant = Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.cell_phone, category: category)
  puts "Created #{new_restaurant.name}"
  review_number = [1, 2, 3].sample
  review_number.times do
    rating_number = [1, 2, 3, 4, 5].sample
    new_review = Review.create!(rating: rating_number, content: Faker::Restaurant.review, restaurant_id: new_restaurant.id)
      puts "Created Review, score: #{new_review.rating}"
  end
end

puts "Finished!"
# :name, :address, :phone_number, :category
# :rating :content :restaurant
