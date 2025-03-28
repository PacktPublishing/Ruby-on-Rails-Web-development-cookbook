class Event < ApplicationRecord
  has_many :attendees

  belongs_to :venue

  # Default scope to only return active events
  default_scope { where(active: true) }

  # Scope for upcoming events
  scope :upcoming, -> { where("start_date >= ?", Date.today) }

  # Scope for popular events (more than 100 attendees)
  scope :popular, -> { joins(:attendees).group("events.id").having("COUNT(attendees.id) > 100") }

  # Scope for events in a specific city
  scope :in_city, ->(city_name) { joins(:venue).where(venues: {city: city_name}) }
end
