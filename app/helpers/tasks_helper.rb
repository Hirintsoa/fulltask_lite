module TasksHelper
  def task_priority_options
    Task.priorities.keys.map { |key| [key.titleize, key] }
  end

  def format_priority(priority)
    case priority
    when "low" then content_tag(:span, "Low", class: "badge badge-secondary")
    when "medium" then content_tag(:span, "Medium", class: "badge badge-warning")
    when "high" then content_tag(:span, "High", class: "badge badge-danger")
    end
  end
end
