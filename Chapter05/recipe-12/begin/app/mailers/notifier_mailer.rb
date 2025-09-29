class NotifierMailer < ApplicationMailer
  def ticket_escalated(ticket)
    @ticket = ticket
    
    mail(
      to: "support@example.org",
      subject: "Ticket ##{ticket.id} has been escalated"
    )
  end
end
