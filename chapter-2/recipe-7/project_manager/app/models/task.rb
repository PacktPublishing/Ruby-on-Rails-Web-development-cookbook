class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :due_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending in_progress completed blocked] }
  validate :due_date_within_project_dates

  private

  def due_date_within_project_dates
    return unless project && due_date

    if project.start_date && due_date < project.start_date
      errors.add(:due_date, "cannot be before project start date")
    end

    if project.end_date && due_date > project.end_date
      errors.add(:due_date, "cannot be after project end date")
    end
  end
end 