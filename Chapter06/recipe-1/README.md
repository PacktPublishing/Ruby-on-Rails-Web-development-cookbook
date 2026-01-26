# Quick Usage Example

## Create a new ToDo app

```bash
# From the directory containing todo_app_template.rb
rails new my_todo_app -m todo_app_template.rb
```

The template will automatically:
- Install all dependencies (`bundle install`)
- Create the database (`rails db:create`)
- Run migrations (`rails db:migrate`)

## Start the application

```bash
cd my_todo_app
bin/rails server
```

Then visit http://localhost:3000

## What you'll see

- A beautiful gradient purple background
- Task cards displayed in a responsive grid
- "New Task" button to create tasks
- Each card shows:
  - Task title
  - Task description (if provided)
  - Action buttons (Show, Edit, Delete, Mark Complete/Incomplete)

## Features

- ✅ Create new tasks with title and description
- ✅ Mark tasks as complete (they'll show with strikethrough)
- ✅ Edit existing tasks
- ✅ Delete tasks
- ✅ View task details
- ✅ Beautiful Trello-inspired card design
- ✅ Responsive design that works on mobile

Enjoy your new ToDo app! 🎉