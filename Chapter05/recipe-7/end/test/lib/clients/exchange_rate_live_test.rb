require "test_helper"
require "clients/exchange_rate"

class ExchangeRateLiveTest < ActiveSupport::TestCase
  test "fetches a real rate (cassette)" do
    skip "Enable with RUN_LIVE=1" unless ENV["RUN_LIVE"] == "1"
    VCR.use_cassette("fx/usd_eur") do
      fx = ExchangeRate.new
      assert fx.rate(from: "USD", to: "EUR") > 0
    end
  end
end