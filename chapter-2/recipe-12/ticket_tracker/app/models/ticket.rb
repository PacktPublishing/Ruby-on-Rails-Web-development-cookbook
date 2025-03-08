class Ticket < ApplicationRecord
  enum :status, { open: 0, in_progress: 1, resolved: 2, on_hold: 3 }

  def start_progress!
    if open? && agent.present?
      update! status: :in_progress
    else
      raise "Can't mark the ticket as in progress because the ticket is either not open or an agent isn't assigned"
    end
  end
end
