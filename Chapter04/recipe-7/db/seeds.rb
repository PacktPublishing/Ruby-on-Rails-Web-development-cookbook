# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create sample notes
Note.create!(
  title: "Welcome to Notes",
  content: "This is your first note! You can create, edit, and delete notes just like in Apple Notes. The interface is clean and responsive, designed to work well on all devices."
)

Note.create!(
  title: "Shopping List",
  content: "- Milk\n- Bread\n- Eggs\n- Bananas\n- Coffee\n- Paper towels\n\nRemember to check for sales!"
)

Note.create!(
  title: "Meeting Notes - Project Planning",
  content: "Team Meeting - January 15, 2024\n\nAgenda:\n1. Review Q4 results\n2. Plan Q1 objectives\n3. Discuss new features\n4. Budget allocation\n\nAction Items:\n- John: Prepare Q4 report\n- Sarah: Research competitor features\n- Mike: Create budget proposal\n\nNext meeting: January 22, 2024"
)

Note.create!(
  title: "Recipe - Chocolate Chip Cookies",
  content: "Ingredients:\n- 2 1/4 cups flour\n- 1 cup butter, softened\n- 3/4 cup sugar\n- 3/4 cup brown sugar\n- 2 eggs\n- 1 tsp vanilla\n- 1 tsp baking soda\n- 1/2 tsp salt\n- 2 cups chocolate chips\n\nInstructions:\n1. Preheat oven to 375°F\n2. Cream butter and sugars\n3. Beat in eggs and vanilla\n4. Mix in dry ingredients\n5. Stir in chocolate chips\n6. Drop by rounded tablespoons\n7. Bake 9-11 minutes\n\nMakes about 4 dozen cookies!"
)

Note.create!(
  title: "Travel Plans - Summer Vacation",
  content: "Destination: Paris, France\nDates: July 15-25, 2024\n\nMust-see places:\n- Eiffel Tower\n- Louvre Museum\n- Notre-Dame Cathedral\n- Champs-Élysées\n- Montmartre\n- Palace of Versailles\n\nRestaurants to try:\n- Le Comptoir du Relais\n- L'Arpège\n- Le Chateaubriand\n\nAccommodation: Hotel booked in Marais district\n\nBudget: $3,000 for 10 days"
)
