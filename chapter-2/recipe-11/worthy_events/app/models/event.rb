class Event < ApplicationRecord
  has_many :attendees

  belongs_to :venue
end

