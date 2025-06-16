require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get new" do
    get new_task_list_task_url(@task.task_list)
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post task_list_tasks_url(@task.task_list), params: { task: { completed: @task.completed, description: @task.description, priority: @task.priority, task_list_id: @task.task_list_id, title: @task.title } }
    end

    assert_redirected_to task_list_url(@task.task_list)
  end

  test "should show task" do
    get task_list_task_url(@task.task_list, @task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_list_task_url(@task.task_list, @task)
    assert_response :success
  end

  test "should update task" do
    patch task_list_task_url(@task.task_list, @task), params: { task: { completed: @task.completed, description: @task.description, priority: @task.priority, task_list_id: @task.task_list_id, title: "#{@task.title}-updated" } }
    assert_redirected_to task_list_url(@task.task_list)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_list_task_url(@task.task_list, @task)
    end

    assert_redirected_to task_list_url(@task.task_list)
  end
end
