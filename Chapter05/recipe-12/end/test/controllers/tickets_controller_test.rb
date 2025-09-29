require "test_helper"

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get tickets_url
    assert_response :success
    assert_select "table"
  end

  test "should get show" do
    get ticket_url(@ticket)
    assert_response :success
    assert_select "h1", text: "Ticket ##{@ticket.id}"
  end

  test "should get new" do
    get new_ticket_url
    assert_response :success
    assert_select "form"
  end

  test "should create ticket" do
    assert_difference("Ticket.count") do
      post tickets_url, params: { ticket: { title: "New Ticket", description: "Test description" } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test "should not create ticket without title" do
    assert_no_difference("Ticket.count") do
      post tickets_url, params: { ticket: { description: "Test description" } }
    end

    assert_response :unprocessable_content
  end
end
