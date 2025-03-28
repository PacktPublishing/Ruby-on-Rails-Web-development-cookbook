class SupportTicket < ApplicationRecord
  belongs_to :employee, optional: true

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: %w[open in_progress resolved closed] }
  validates :priority, presence: true, inclusion: { in: %w[low medium high urgent] }

  scope :unassigned, -> { where(employee_id: nil) }
  scope :open_tickets, -> { where(status: %w[open in_progress]) }
  scope :by_priority, -> { order(priority: :desc) }
end 