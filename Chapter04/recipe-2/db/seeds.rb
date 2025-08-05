# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(
  email: 'frodo.baggins@shire.me',
  password: 'ringbearer',
  timezone: 'Pacific Time (US & Canada)',
  public: true,
  date_of_birth: Date.new(2980, 9, 22) # Shire-reckoning
)
