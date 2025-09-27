require "test_helper"

class ListTest < ActiveSupport::TestCase
  fixtures :lists, :tasks

  test "progress for groceries list" do
    stats = lists(:groceries).progress
    assert_equal 3, stats[:total]
    assert_equal 2, stats[:completed]
    assert_equal 1, stats[:remaining]
    assert_equal 67, stats[:percent_complete]
  end

  test "progress for work list" do
    stats = lists(:work).progress
    assert_equal 4, stats[:total]
    assert_equal 1, stats[:completed]
    assert_equal 3, stats[:remaining]
    assert_equal 25, stats[:percent_complete]
  end
end
