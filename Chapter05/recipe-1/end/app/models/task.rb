class Task < ApplicationRecord
  belongs_to :list

  validates_presence_of :title

  def overdue?
    due_on.present? && !completed? && due_on < Date.current
  end
end
