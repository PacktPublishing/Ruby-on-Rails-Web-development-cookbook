class Ticket < ApplicationRecord
  enum :status, { open: 0, closed: 1, escalated: 2 }, default: :open

  validates :title, presence: true
  validates :description, presence: true

  def close!
    update!(status: :closed)
  end

  def escalate!
    update!(status: :escalated)
    EscalationJob.perform_later(self)
    NotifierMailer.ticket_escalated(self).deliver_later
  end
end
