require "test_helper"

class TasksViewTest < ActionView::TestCase
  def setup
    @list = List.create! name: "Birthday party 2025"
    @task = Task.create! list: @list, title: "Get party supplies", due_on: Date.tomorrow
  end

  test "task appears on the list page" do
    render template: "lists/show", list: @list
    assert_includes rendered, @task.title
  end
end
