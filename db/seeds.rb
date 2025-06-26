# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
TaskList.destroy_all

personal_list = TaskList.create!(
  title: "Prep my future",
  description: "Get ready for a new exciting opportunity."
)

personal_list.tasks.create!([
  {
    title: "Lorem ipsum morning routine",
    description: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    priority: "high",
    completed: true
  },
  {
    title: "Dolor sit amet reading session",
    description: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
    priority: "medium",
    completed: false
  },
  {
    title: "Consectetur adipiscing workout",
    description: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    priority: "high",
    completed: false
  },
  {
    title: "Sed do eiusmod meditation",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
    priority: "low",
    completed: true
  },
  {
    title: "Tempor incididunt skill practice",
    description: "Ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
    priority: "medium",
    completed: false
  }
])

work_list = TaskList.create!(
  title: "Improve skills",
  description: "Continuous Learning, Continuous Delivery."
)

work_list.tasks.create!([
  {
    title: "Errrrrrrrr",
    description: "Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt.",
    priority: "high",
    completed: false
  },
  {
    title: "JVLIVS",
    description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.",
    priority: "high",
    completed: true
  },
  {
    title: "Ce monde est cruel",
    description: "Modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
    priority: "medium",
    completed: false
  },
  {
    title: "Destin",
    description: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.",
    priority: "low",
    completed: true
  }
])

puts "Created #{TaskList.count} task lists with #{Task.count} total tasks"
puts "Personal list: #{personal_list.tasks.count} tasks (#{personal_list.tasks.completed.count} completed)"
puts "Work list: #{work_list.tasks.count} tasks (#{work_list.tasks.completed.count} completed)"
