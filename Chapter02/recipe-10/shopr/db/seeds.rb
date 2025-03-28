# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# add data in all environments here
puts "Seeding Product Categories..."
categories = [
  {name: "Electronics"},
  {name: "Books"},
  {name: "Home & Kitchen"},
  {name: "Fashion"},
  {name: "Health & Personal Care"}
]

categories.each do |category_data|
  Category.find_or_create_by(name: category_data[:name])
end

case Rails.env
when "development", "test"
  # add sample data here
  10.times do
    puts "Seeding Users..."
    User.create(name: Faker::Name.name,
      email: Faker::Internet.email)

    puts "Seeding Products..."
    products = []
    20.times do
      products << Product.create(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.sentence(word_count: 10),
        price: Faker::Commerce.price(range: 10.0..100.0),
        category: Category.find_by(name: categories.sample[:name])
      )
    end
  end

when "production"
  # Seeding Admin User
  puts "Seeding Admin User..."

  User.find_or_create_by(email: "admin@example.com") do |user|
    user.name = "Admin User"
    user.password = ENV["ADMIN_USER_PASSWORD"]
    user.role = "admin"
  end
end
