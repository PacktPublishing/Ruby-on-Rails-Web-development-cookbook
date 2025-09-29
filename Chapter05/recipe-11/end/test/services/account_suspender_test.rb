require 'minitest/mock'

class AccountSuspenderTest < ActiveSupport::TestCase
  test "calls suspend! with time and reason when condition is true" do
    fixed_time = Time.zone.parse("2025-08-31 12:00")

    user = Minitest::Mock.new
    user.expect :suspend!, :ok do |at:, reason:|
      at == fixed_time && reason == "fraud"
    end

    result = AccountSuspender.new(user, clock: -> { fixed_time })
      .call(reason: "fraud", suspend: true)

    assert_equal :suspended, result
    user.verify
  end

  test "does call suspend! when condition is false" do
    user = Minitest::Mock.new

    result = AccountSuspender.new(user).call(reason: "fraud", suspend: false)

    assert_equal :skipped, result
    user.verify
  end
end
