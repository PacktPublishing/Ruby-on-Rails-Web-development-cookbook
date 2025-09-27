require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  test "user adds a task to a list" do
    visit list_path(lists(:groceries))

    fill_in "task_title", with: "Buy bread"
    fill_in "task_due_on", with: "01/20/2025"
    click_button "Add Task"

    assert_selector ".task-title", text: "Buy bread"

    task = lists(:groceries).tasks.find_by(title: "Buy bread")
    assert task.present?
    assert_equal Date.parse("2025-01-20"), task.due_on
  end

  test "user marks a task complete and it persists" do
    visit list_path(lists(:groceries))

    assert_selector ".task-title", text: "Buy flour"
    assert_no_selector ".task-item.completed .task-title", text: "Buy flour"

    within find(".task-item", text: "Buy flour") do
      find("input[type='checkbox']").click
    end

    assert_selector ".task-item.completed .task-title", text: "Buy flour"

    assert tasks(:buy_flour).reload.completed?
  end

  test "user sees a validation error when adding a blank title" do
    visit list_path(lists(:groceries))

    initial_task_count = all(".task-item").count

    click_button "Add Task"
    take_screenshot

    assert_current_path list_path(lists(:groceries))

    assert_selector ".error-messages", text: "Title can't be blank"

    assert_equal initial_task_count, all(".task-item").count
    assert_equal initial_task_count, lists(:groceries).tasks.count
  end
end
