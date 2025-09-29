class Account < ApplicationRecord
  InsufficientFunds = Class.new(StandardError)

  def self.transfer_money(from:, to:, amount_cents:)
    raise InsufficientFunds if from.balance_cents < amount_cents
    ApplicationRecord.transaction do
      from.update!(balance_cents: from.balance_cents - amount_cents)
      to.update!(balance_cents: to.balance_cents + amount_cents)
    end
  end
end
