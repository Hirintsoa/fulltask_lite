module TaskListsHelper
  def task_list_completion_status(task_list)
    "#{task_list.tasks.completed.count} / #{task_list.tasks.count} tasks completed"
  end
end
