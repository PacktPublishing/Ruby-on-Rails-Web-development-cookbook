# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
puts "Cleaning database..."
Attendee.destroy_all
Event.destroy_all
Venue.destroy_all

# Create venues
puts "Creating venues..."
venues = {
  austin: Venue.create!(
    name: "Austin Convention Center",
    address: "500 E Cesar Chavez St",
    city: "Austin",
    state: "TX"
  ),
  dallas: Venue.create!(
    name: "Dallas Event Center",
    address: "1234 Main St",
    city: "Dallas",
    state: "TX"
  ),
  houston: Venue.create!(
    name: "Houston Arena",
    address: "5678 Broadway St",
    city: "Houston",
    state: "TX"
  )
}

# Create events
puts "Creating events..."
events = []

# Upcoming active events
5.times do |i|
  events << Event.create!(
    title: "Upcoming Tech Conference #{i + 1}",
    description: "Join us for an amazing tech conference with industry leaders",
    start_date: Date.today + (i + 1).months,
    end_date: Date.today + (i + 1).months + 3.days,
    active: true,
    venue: venues.values.sample
  )
end

# Past active events
3.times do |i|
  events << Event.create!(
    title: "Past Music Festival #{i + 1}",
    description: "A celebration of local music talent",
    start_date: Date.today - (i + 1).months,
    end_date: Date.today - (i + 1).months + 2.days,
    active: true,
    venue: venues.values.sample
  )
end

# Inactive events
2.times do |i|
  events << Event.create!(
    title: "Cancelled Conference #{i + 1}",
    description: "This event has been cancelled",
    start_date: Date.today + (i + 1).months,
    end_date: Date.today + (i + 1).months + 1.day,
    active: false,
    venue: venues.values.sample
  )
end

# Create attendees
puts "Creating attendees..."
events.each do |event|
  # Create between 90 and 120 attendees for each event
  attendee_count = rand(90..120)
  
  attendee_count.times do |i|
    Attendee.create!(
      name: "Attendee #{i + 1}",
      email: "attendee#{i + 1}_#{event.id}@example.com",
      event: event
    )
  end
end

puts "Seed completed! Created:"
puts "- #{Venue.count} venues"
puts "- #{Event.count} events"
puts "- #{Attendee.count} attendees"
