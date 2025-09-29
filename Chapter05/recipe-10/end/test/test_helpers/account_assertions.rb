module AccountAssertions
  def assert_transfers(by:, from:, to:)
    total_before = from.reload.balance_cents + to.reload.balance_cents
    assert_difference(-> { from.reload.balance_cents }, -by) do
      assert_difference(-> { to.reload.balance_cents }, by) { yield }
    end
    assert_equal total_before, from.reload.balance_cents + to.reload.balance_cents, "total funds not conserved"
  end

  def assert_transfer_rejected(error:, from:, to:)
    assert_no_changes(-> { from.reload.balance_cents }) do
      assert_no_changes(-> { to.reload.balance_cents }) { assert_raises(error) { yield } }
    end
  end
end
