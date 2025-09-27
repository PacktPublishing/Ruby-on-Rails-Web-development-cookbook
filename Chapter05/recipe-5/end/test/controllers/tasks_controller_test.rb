require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @list = List.create! name: "Birthday party 2025"
  end

  test "should create a task" do
    assert_difference -> { Task.count } do
      post list_tasks_path(@list),
        params: {
          task: {
            title: "Get party supplies", due_on: Date.tomorrow
          }
        }

      assert_redirected_to list_path(@list)
    end
  end

end
