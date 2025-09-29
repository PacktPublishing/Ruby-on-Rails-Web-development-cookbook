require "test_helper"

class FakeExchangeRate
  def self.for(from:, to:)
    0.92
  end
end

class InvoiceTest < ActiveSupport::TestCase
  test "converts amount using exchange rate" do
    inv = Invoice.create!(amount_cents: 100_00, currency: "EUR") # $100.00
    assert_equal 92_00, inv.amount_in("USD", exchange: FakeExchangeRate)
  end

  test "no-op when target equals source currency" do
    inv = Invoice.create!(amount_cents: 123_45, currency: "EUR")
    assert_equal 123_45, inv.amount_in("EUR")
  end
end
