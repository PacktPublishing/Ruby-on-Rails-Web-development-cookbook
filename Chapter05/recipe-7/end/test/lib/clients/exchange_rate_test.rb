require "test_helper"

class ExchangeRateTest < ActiveSupport::TestCase
  setup { @client = ExchangeRate.new(api_key: "test") }

  test "parses rate on success" do
    stub_request(:get, %r{data\.fixer\.io/api/latest})
      .to_return(status: 200, body: { success: true, rates: { "EUR" => 0.92 } }.to_json,
                 headers: { "Content-Type" => "application/json" })

    assert @client.rate(from: "USD", to: "EUR"), 0.92
  end
end
