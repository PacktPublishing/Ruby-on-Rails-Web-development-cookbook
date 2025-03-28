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
puts "Cleaning database..."
SupportTicket.destroy_all
Task.destroy_all
Assignment.destroy_all
Project.destroy_all
Employee.destroy_all

# Create Employees
puts "Creating employees..."
employees = {
  ceo: Employee.create!(
    name: "Sarah Johnson",
    email: "sarah.johnson@example.com"
  ),
  tech_lead: Employee.create!(
    name: "Michael Chen",
    email: "michael.chen@example.com"
  ),
  developer: Employee.create!(
    name: "Emily Rodriguez",
    email: "emily.rodriguez@example.com"
  ),
  designer: Employee.create!(
    name: "David Kim",
    email: "david.kim@example.com"
  ),
  project_manager: Employee.create!(
    name: "Lisa Thompson",
    email: "lisa.thompson@example.com"
  )
}

# Create Projects
puts "Creating projects..."
projects = {
  website_redesign: Project.create!(
    name: "Website Redesign",
    description: "Complete overhaul of company website with modern design and improved UX",
    start_date: Date.today,
    end_date: 3.months.from_now,
    status: "active"
  ),
  mobile_app: Project.create!(
    name: "Mobile App Development",
    description: "Develop a new mobile app for customer engagement",
    start_date: Date.today + 1.week,
    end_date: 6.months.from_now,
    status: "pending"
  ),
  data_migration: Project.create!(
    name: "Legacy Data Migration",
    description: "Migrate data from old system to new cloud platform",
    start_date: 2.weeks.ago,
    end_date: 2.weeks.from_now,
    status: "active"
  )
}

# Create Assignments
puts "Creating assignments..."
# Website Redesign Project Assignments
Assignment.create!(
  employee: employees[:project_manager],
  project: projects[:website_redesign],
  role: "manager"
)
Assignment.create!(
  employee: employees[:designer],
  project: projects[:website_redesign],
  role: "lead"
)
Assignment.create!(
  employee: employees[:developer],
  project: projects[:website_redesign],
  role: "member"
)

# Mobile App Project Assignments
Assignment.create!(
  employee: employees[:project_manager],
  project: projects[:mobile_app],
  role: "manager"
)
Assignment.create!(
  employee: employees[:tech_lead],
  project: projects[:mobile_app],
  role: "lead"
)
Assignment.create!(
  employee: employees[:developer],
  project: projects[:mobile_app],
  role: "member"
)

# Data Migration Project Assignments
Assignment.create!(
  employee: employees[:tech_lead],
  project: projects[:data_migration],
  role: "lead"
)
Assignment.create!(
  employee: employees[:developer],
  project: projects[:data_migration],
  role: "member"
)

# Create Tasks
puts "Creating tasks..."
# Website Redesign Tasks
Task.create!(
  project: projects[:website_redesign],
  title: "Design Homepage Mockup",
  description: "Create initial mockups for the new homepage design",
  due_date: 2.weeks.from_now,
  status: "in_progress"
)
Task.create!(
  project: projects[:website_redesign],
  title: "Implement Responsive Navigation",
  description: "Develop and test responsive navigation menu",
  due_date: 1.month.from_now,
  status: "pending"
)

# Mobile App Tasks
Task.create!(
  project: projects[:mobile_app],
  title: "User Authentication System",
  description: "Implement secure user authentication",
  due_date: 2.months.from_now,
  status: "pending"
)
Task.create!(
  project: projects[:mobile_app],
  title: "Push Notification Setup",
  description: "Set up and configure push notifications",
  due_date: 3.months.from_now,
  status: "pending"
)

# Data Migration Tasks
Task.create!(
  project: projects[:data_migration],
  title: "Data Mapping",
  description: "Create mapping document for old to new system",
  due_date: 1.week.from_now,
  status: "completed"
)
Task.create!(
  project: projects[:data_migration],
  title: "Migration Script Development",
  description: "Develop and test migration scripts",
  due_date: 2.weeks.from_now,
  status: "in_progress"
)

# Create Support Tickets
puts "Creating support tickets..."
SupportTicket.create!(
  title: "Login Issues",
  description: "Users unable to login after password reset",
  status: "open",
  priority: "high",
  employee: employees[:tech_lead]
)
SupportTicket.create!(
  title: "Performance Optimization",
  description: "Website loading slowly during peak hours",
  status: "in_progress",
  priority: "medium",
  employee: employees[:developer]
)
SupportTicket.create!(
  title: "Feature Request",
  description: "Add dark mode to the application",
  status: "open",
  priority: "low"
)
SupportTicket.create!(
  title: "Database Connection Error",
  description: "Intermittent database connection failures",
  status: "open",
  priority: "urgent",
  employee: employees[:tech_lead]
)

puts "Seed completed successfully!"
