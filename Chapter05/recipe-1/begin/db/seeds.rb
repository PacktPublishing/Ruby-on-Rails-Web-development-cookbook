# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create sample lists
sample_list = List.find_or_create_by!(
  name: "Web Development Project"
) do |list|
  list.description = "Tasks for building a modern web application with Rails and React"
end

puts "Created sample list: #{sample_list.name}"
