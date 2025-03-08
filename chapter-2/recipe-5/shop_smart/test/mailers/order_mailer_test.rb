require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "confirmation_email" do
    mail = OrderMailer.confirmation_email
    assert_equal "Confirmation email", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
