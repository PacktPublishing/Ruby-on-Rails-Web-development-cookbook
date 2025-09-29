require "test_helper"

class NotifierMailerTest < ActionMailer::TestCase
  test "ticket_escalated" do
    ticket = tickets(:one)
    mail = NotifierMailer.ticket_escalated(ticket)
    assert_equal "Ticket ##{ticket.id} has been escalated", mail.subject
    assert_equal [ "support@example.org" ], mail.to
    assert_match "Ticket ##{ticket.id} has been escalated", mail.body.encoded
  end
end
