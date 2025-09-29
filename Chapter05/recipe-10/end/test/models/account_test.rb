require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "transfer_money should transfer funds between accounts" do
    from_account = Account.create!(balance_cents: 1000)
    to_account = Account.create!(balance_cents: 500)

    assert_transfers(by: 300, from: from_account, to: to_account) do
      Account.transfer_money(from: from_account, to: to_account, amount_cents: 300)
    end
  end

  test "transfer_money should raise InsufficientFunds when balance is too low" do
    from_account = Account.create!(balance_cents: 100)
    to_account = Account.create!(balance_cents: 0)

    assert_transfer_rejected(error: Account::InsufficientFunds, from: from_account, to: to_account) do
      Account.transfer_money(from: from_account, to: to_account, amount_cents: 300)
    end
  end
end
