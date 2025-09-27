require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "task is overdue when due date is in past and task is not completed" do
    task = Task.new due_on: Date.yesterday, completed: false
    assert_equal true, task.overdue?, "Task should be overdue since it is not completed and due date was yesterday"
  end

  test "task is not overdue when due date is in past and task is completed" do
    task = Task.new due_on: Date.yesterday, completed: true
    assert_equal false, task.overdue?, "Task should not be overdue since it is not completed and due date was yesterday"
  end

  test "task is not overdue when due date is in future and task is completed" do
    task = Task.new due_on: Date.tomorrow, completed: true
    assert_equal false, task.overdue?, "Task should not be overdue since due date is tomorrow"
  end

  test "task is not overdue when due date is in future and task is not completed" do
    task = Task.new due_on: Date.tomorrow, completed: false
    assert_equal false, task.overdue?, "Task should not be overdue since due date is tomorrow"
  end

  test "Task always has a title" do
    task_without_title = Task.new list: lists(:groceries)
    assert_not task_without_title.save, "Task must have a title"

    task_with_title = Task.new title: "Get groceries", list: lists(:groceries)
    assert task_with_title.save, "Task with title should save successfully"
  end

  # Tests for Task#status_summary
  test "overdue when past & not completed" do
    t = Task.new(due_on: Date.yesterday, completed: false)
    assert_equal "Overdue", t.status_summary
  end

  test "due today when today & not completed" do
    t = Task.new(due_on: Date.current, completed: false)
    assert_equal "Due today", t.status_summary
  end

  test "due in N days when future & not completed" do
    t = Task.new(due_on: Date.current + 3, completed: false)
    assert_equal "Due in 3 days", t.status_summary
  end

  test "completed ignores due_on" do
    t = Task.new(due_on: Date.yesterday, completed: true)
    assert_equal "Completed", t.status_summary
  end

  test "no due date when due_on is nil & not completed" do
    t = Task.new(due_on: nil, completed: false)
    assert_equal "No due date", t.status_summary
  end
end
