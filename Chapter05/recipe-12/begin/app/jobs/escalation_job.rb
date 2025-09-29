class EscalationJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    Rails.logger.info "Processing escalation for ticket ##{ticket.id}"
  end
end
