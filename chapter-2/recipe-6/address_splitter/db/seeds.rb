# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create sample users with names and addresses
sample_data = [
  "John Smith, 123 Main Street, New York, NY 10001",
  "Sarah Johnson, 456 Oak Avenue, Los Angeles, CA 90012",
  "Michael Brown, 789 Pine Road, Chicago, IL 60601",
  "Emily Davis, 321 Maple Lane, Houston, TX 77002",
  "David Wilson, 654 Cedar Street, Miami, FL 33101",
  "Lisa Anderson, 987 Elm Court, Seattle, WA 98101",
  "Robert Taylor, 147 Birch Drive, Boston, MA 02108",
  "Jennifer Martinez, 258 Willow Way, San Francisco, CA 94105",
  "William Thompson, 369 Spruce Boulevard, Denver, CO 80202",
  "Jessica Rodriguez, 741 Aspen Circle, Phoenix, AZ 85001"
]

sample_data.each do |address|
  User.create!(address: address)
end

puts "Created #{User.count} users with addresses"
