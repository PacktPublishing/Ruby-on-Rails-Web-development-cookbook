class Invoice < ApplicationRecord
  def amount_in(target_currency, exchange: ExchangeRate)
    return amount_cents if target_currency == currency
    fx = exchange.for(from: currency, to: target_currency)
    (amount_cents * fx).round
  end
end
