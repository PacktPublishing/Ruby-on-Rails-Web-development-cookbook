class Todo < ApplicationRecord
  belongs_to :project
  validates :content, presence: true
end