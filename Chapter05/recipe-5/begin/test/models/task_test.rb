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
end
