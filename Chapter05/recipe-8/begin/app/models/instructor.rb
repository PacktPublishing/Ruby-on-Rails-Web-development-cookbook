class Instructor < ApplicationRecord
  has_many :courses, dependent: :destroy
end
