require 'net/http'
require 'json'
require 'uri'

class ExchangeRate
  def self.for(from:, to:)
    new.rate(from: from, to: to)
  end

  def initialize(api_key: ENV["FIXER_API_KEY"])
    @api_key = api_key
  end

  def rate(from:, to:)
    uri = URI("http://data.fixer.io/api/latest?access_key=#{@api_key}&base=#{from}&symbols=#{to}")
    res = Net::HTTP.get_response(uri)

    body = JSON.parse(res.body)
    body.fetch("rates").fetch(to).to_f
  end
end
