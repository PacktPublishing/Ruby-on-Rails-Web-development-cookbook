require "test_helper"

class TicketTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper
  test "should be valid with valid attributes" do
    ticket = Ticket.new(title: "Test ticket", description: "Test description")
    assert ticket.valid?
  end

  test "should require title" do
    ticket = Ticket.new(description: "Test description")
    assert_not ticket.valid?
    assert_includes ticket.errors[:title], "can't be blank"
  end

  test "should require description" do
    ticket = Ticket.new(title: "Test ticket")
    assert_not ticket.valid?
    assert_includes ticket.errors[:description], "can't be blank"
  end

  test "should default to open status" do
    ticket = Ticket.new(title: "Test ticket", description: "Test description")
    assert_equal "open", ticket.status
  end

  test "close! should set status to closed" do
    ticket = tickets(:one)
    ticket.close!
    assert_equal "closed", ticket.status
  end

  test "escalate! should set status to escalated and enqueue job" do
    ticket = tickets(:one)
    
    assert_enqueued_jobs 1, only: EscalationJob do
      ticket.escalate!
    end
    
    assert_equal "escalated", ticket.status
  end
end
