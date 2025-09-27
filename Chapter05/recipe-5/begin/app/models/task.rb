class Task < ApplicationRecord
  belongs_to :list

  validates_presence_of :title

  scope :completed, -> { where(completed: true) }

  def completed?
    completed == true
  end

  def overdue?
    due_on.present? && !completed? && due_on < Date.current
  end
end
