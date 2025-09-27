class Task < ApplicationRecord
  include StatusSummarizable

  belongs_to :list

  validates_presence_of :title

  scope :completed, -> { where(completed: true) }

  def status_summary
    return "Completed" if completed?
    return "No due date" if due_on.blank?

    return "Overdue" if due_on < Date.current
    return "Due today" if due_on == Date.current

    "Due in #{(due_on - Date.current).to_i} days"
  end

  def completed?
    completed == true
  end

  def overdue?
    due_on.present? && !completed? && due_on < Date.current
  end
end
