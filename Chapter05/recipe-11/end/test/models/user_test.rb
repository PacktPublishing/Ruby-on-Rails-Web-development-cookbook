require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "suspend! sets suspended_at with default time" do
    user = User.create!(name: "John Doe", email: "john@example.com")

    user.suspend!(reason: "Policy violation")

    assert user.suspended?
    assert_not_nil user.suspended_at
    assert_equal "Policy violation", user.suspension_reason
  end

  test "suspend! accepts custom at time" do
    user = User.create!(name: "Jane Doe", email: "jane@example.com")
    custom_time = 1.day.ago

    user.suspend!(at: custom_time, reason: "Account breach")

    assert user.suspended?
    assert_equal custom_time, user.suspended_at
    assert_equal "Account breach", user.suspension_reason
  end

  test "suspend! works without reason" do
    user = User.create!(name: "Bob Smith", email: "bob@example.com")

    user.suspend!

    assert user.suspended?
    assert_not_nil user.suspended_at
    assert_nil user.suspension_reason
  end

  test "suspended? returns false for new user" do
    user = User.create!(name: "Alice Brown", email: "alice@example.com")

    assert_not user.suspended?
  end
end