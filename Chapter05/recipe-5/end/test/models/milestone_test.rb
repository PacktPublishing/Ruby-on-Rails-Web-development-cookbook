require "test_helper"

class MilestoneTest < ActiveSupport::TestCase
  # Tests for Milestone#status_summary
  test "overdue when past & not completed" do
    m = Milestone.new(due_on: Date.yesterday, completed: false)
    assert_equal "Overdue", m.status_summary
  end

  test "due today when today & not completed" do
    m = Milestone.new(due_on: Date.current, completed: false)
    assert_equal "Due today", m.status_summary
  end

  test "due in N days when future & not completed" do
    m = Milestone.new(due_on: Date.current + 3, completed: false)
    assert_equal "Due in 3 days", m.status_summary
  end

  test "completed ignores due_on" do
    m = Milestone.new(due_on: Date.yesterday, completed: true)
    assert_equal "Completed", m.status_summary
  end

  test "no due date when due_on is nil & not completed" do
    m = Milestone.new(due_on: nil, completed: false)
    assert_equal "No due date", m.status_summary
  end

  test "blocked when not complete" do
    m = Milestone.new(due_on: Date.current + 3, completed: false, blocked: true)
    assert_equal "Blocked: Due in 3 days", m.status_summary
  end
end
