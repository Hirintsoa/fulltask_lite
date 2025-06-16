require "test_helper"

class TaskListsFlowTest < ActionDispatch::IntegrationTest
  test "full task list flow with guard clause" do
    # Create a task list
    post task_lists_url, params: { task_list: { title: "Flow List", description: "Flow Desc" } }
    task_list = TaskList.last
    assert_equal "Flow List", task_list.title

    post task_list_tasks_url(task_list), params: { task: { title: "Task 1", task_list_id: task_list.id, priority: :high } }
    post task_list_tasks_url(task_list), params: { task: { title: "Task 2", task_list_id: task_list.id, priority: :low } }
    assert_equal 2, task_list.tasks.count

    # Try to delete with incomplete tasks (should fail)
    delete task_list_url(task_list)
    assert TaskList.exists?(task_list.id)

    # Complete all tasks
    task_list.tasks.update_all(completed: true)

    # Now delete (should succeed)
    delete task_list_url(task_list)
    assert_not TaskList.exists?(task_list.id)
  end
end 
