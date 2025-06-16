module TasksHelper
  def task_priority_options
    Task.priorities.keys.map { |key| [key.titleize, key] }
  end
end
