# Rails Application Template for ToDo App with Trello-inspired Design
# Usage: rails new todo_app -m todo_app_template.rb

# Set root route
route "root to: 'tasks#index'"
route "resources :tasks"

# Create custom CSS file for Trello-inspired design
file "app/assets/stylesheets/tasks.css", <<-CSS
/* Trello-inspired card design */
body {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  min-height: 100vh;
  padding: 20px 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.page-header {
  color: white;
  text-align: center;
  margin-bottom: 40px;
}

.page-header h1 {
  font-size: 3rem;
  font-weight: 700;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  margin-bottom: 10px;
}

.page-header p {
  font-size: 1.2rem;
  opacity: 0.9;
}

.task-card {
  background: white;
  border-radius: 8px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
  margin-bottom: 20px;
  padding: 20px;
  position: relative;
  cursor: pointer;
  border-left: 4px solid #667eea;
}

.task-card:hover {
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  transform: translateY(-2px);
}

.task-card.completed {
  opacity: 0.7;
  border-left-color: #28a745;
}

.task-card.completed .task-title {
  text-decoration: line-through;
  color: #6c757d;
}

  .task-title {
    font-size: 1.25rem;
    font-weight: 600;
    color: #2c3e50;
    margin-bottom: 10px;
    word-wrap: break-word;
  }

  .task-description {
    color: #6c757d;
    font-size: 0.95rem;
    line-height: 1.5;
    margin-bottom: 15px;
    word-wrap: break-word;
  }

  .task-actions {
    display: flex;
    gap: 10px;
    margin-top: 15px;
    flex-wrap: wrap;
  }

.btn {
  border-radius: 6px;
  padding: 8px 16px;
  font-weight: 500;
  transition: all 0.2s;
  border: none;
  cursor: pointer;
  text-decoration: none;
  display: inline-block;
}

.btn:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.btn-primary {
  background: #667eea;
  color: white;
}

.btn-primary:hover {
  background: #5568d3;
  color: white;
}

.btn-success {
  background: #28a745;
  color: white;
}

.btn-success:hover {
  background: #218838;
  color: white;
}

.btn-danger {
  background: #dc3545;
  color: white;
}

.btn-danger:hover {
  background: #c82333;
  color: white;
}

.btn-secondary {
  background: #6c757d;
  color: white;
}

.btn-secondary:hover {
  background: #5a6268;
  color: white;
}

.btn-warning {
  background: #ffc107;
  color: #212529;
}

.btn-warning:hover {
  background: #e0a800;
  color: #212529;
}

  .btn-sm {
    padding: 6px 12px;
    font-size: 0.875rem;
  }

.new-task-btn {
  background: white;
  color: #667eea;
  border: 2px solid #667eea;
  padding: 12px 24px;
  font-size: 1.1rem;
  font-weight: 600;
  border-radius: 8px;
  margin-bottom: 30px;
  display: inline-block;
  transition: all 0.3s;
  text-decoration: none;
}

.new-task-btn:hover {
  background: #667eea;
  color: white;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
}

  .tasks-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 20px;
    margin-top: 20px;
  }

  .form-container {
    background: white;
    border-radius: 8px;
    padding: 30px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 0 auto;
  }

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: 600;
  color: #2c3e50;
}

.form-group input[type="text"],
.form-group textarea {
  width: 100%;
  padding: 12px;
  border: 2px solid #e0e0e0;
  border-radius: 6px;
  font-size: 1rem;
  transition: border-color 0.3s;
  box-sizing: border-box;
}

.form-group input[type="text"]:focus,
.form-group textarea:focus {
  outline: none;
  border-color: #667eea;
}

.form-group textarea {
  min-height: 120px;
  resize: vertical;
}

.form-group input[type="checkbox"] {
  width: 20px;
  height: 20px;
  cursor: pointer;
}

.empty-state {
  text-align: center;
  color: white;
  padding: 60px 20px;
}

.empty-state h2 {
  font-size: 2rem;
  margin-bottom: 15px;
}

.empty-state p {
  font-size: 1.1rem;
  opacity: 0.9;
}

.alert {
  padding: 15px 20px;
  border-radius: 6px;
  margin-bottom: 20px;
}

.alert-success {
  background: #d4edda;
  color: #155724;
  border: 1px solid #c3e6cb;
}

.alert-danger {
  background: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
}

.text-center {
  text-align: center;
}

  @media (max-width: 768px) {
    .tasks-grid {
      grid-template-columns: 1fr;
    }

    .page-header h1 {
      font-size: 2rem;
    }
  }
CSS

# Create index view
file "app/views/tasks/index.html.erb", <<-ERB
<div class="container">
  <div class="page-header">
    <h1>📋 My ToDo Board</h1>
    <p>Organize your tasks beautifully</p>
  </div>

  <div class="text-center">
    <%= link_to '+ New Task', new_task_path, class: 'new-task-btn' %>
  </div>

  <% if notice %>
    <div class="alert alert-success">
      <%= notice %>
    </div>
  <% end %>

  <% if @tasks.any? %>
    <div class="tasks-grid">
      <% @tasks.each do |task| %>
        <div class="task-card <%= 'completed' if task.completed %>">
          <div class="task-title">
            <%= task.title %>
          </div>
          <% if task.description.present? %>
            <div class="task-description">
              <%= simple_format(task.description) %>
            </div>
          <% end %>
          <div class="task-actions">
            <%= link_to 'Show', task, class: 'btn btn-primary btn-sm' %>
            <%= link_to 'Edit', edit_task_path(task), class: 'btn btn-secondary btn-sm' %>
            <%= link_to 'Delete', task, method: :delete,
                data: { confirm: 'Are you sure?' },
                class: 'btn btn-danger btn-sm' %>
            <% if task.completed? %>
              <%= link_to 'Mark Incomplete', task_path(task, task: { completed: false }),
                  method: :patch, class: 'btn btn-warning btn-sm' %>
            <% else %>
              <%= link_to 'Mark Complete', task_path(task, task: { completed: true }),
                  method: :patch, class: 'btn btn-success btn-sm' %>
            <% end %>
          </div>
        </div>
      <% end %>
    </div>
  <% else %>
    <div class="empty-state">
      <h2>No tasks yet!</h2>
      <p>Create your first task to get started.</p>
    </div>
  <% end %>
</div>
ERB

# Create show view
file "app/views/tasks/show.html.erb", <<-ERB
<div class="container">
  <div class="form-container">
    <div class="page-header" style="text-align: left; margin-bottom: 30px;">
      <h1 style="font-size: 2rem; color: #2c3e50;">Task Details</h1>
    </div>

    <div class="task-card" style="margin-bottom: 20px;">
      <div class="task-title">
        <%= @task.title %>
      </div>
      <% if @task.description.present? %>
        <div class="task-description">
          <%= simple_format(@task.description) %>
        </div>
      <% end %>
      <div style="margin-top: 15px;">
        <strong>Status:</strong>
        <% if @task.completed? %>
          <span style="color: #28a745; font-weight: 600;">✓ Completed</span>
        <% else %>
          <span style="color: #667eea; font-weight: 600;">○ Pending</span>
        <% end %>
      </div>
    </div>

    <div class="task-actions">
      <%= link_to 'Edit', edit_task_path(@task), class: 'btn btn-primary' %>
      <%= link_to 'Back to List', tasks_path, class: 'btn btn-secondary' %>
      <%= link_to 'Delete', @task, method: :delete,
          data: { confirm: 'Are you sure?' },
          class: 'btn btn-danger' %>
    </div>
  </div>
</div>
ERB

# Create new view
file "app/views/tasks/new.html.erb", <<-ERB
<div class="container">
  <div class="form-container">
    <div class="page-header" style="text-align: left; margin-bottom: 30px;">
      <h1 style="font-size: 2rem; color: #2c3e50;">New Task</h1>
    </div>

    <%= render 'form', task: @task %>

    <%= link_to 'Back to List', tasks_path, class: 'btn btn-secondary' %>
  </div>
</div>
ERB

# Create edit view
file "app/views/tasks/edit.html.erb", <<-ERB
<div class="container">
  <div class="form-container">
    <div class="page-header" style="text-align: left; margin-bottom: 30px;">
      <h1 style="font-size: 2rem; color: #2c3e50;">Edit Task</h1>
    </div>

    <%= render 'form', task: @task %>

    <%= link_to 'Show', @task, class: 'btn btn-primary' %>
    <%= link_to 'Back to List', tasks_path, class: 'btn btn-secondary' %>
  </div>
</div>
ERB

# Create form partial
file "app/views/tasks/_form.html.erb", <<-ERB
<%= form_with(model: task, local: true) do |form| %>
  <% if task.errors.any? %>
    <div class="alert alert-danger">
      <h4><%= pluralize(task.errors.count, "error") %> prohibited this task from being saved:</h4>
      <ul>
        <% task.errors.full_messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <div class="form-group">
    <%= form.label :title %>
    <%= form.text_field :title, class: 'form-control', placeholder: 'Enter task title...' %>
  </div>

  <div class="form-group">
    <%= form.label :description %>
    <%= form.text_area :description, class: 'form-control', placeholder: 'Enter task description...' %>
  </div>

  <div class="form-group">
    <%= form.check_box :completed %>
    <%= form.label :completed, 'Mark as completed' %>
  </div>

  <div class="task-actions">
    <%= form.submit class: 'btn btn-primary', value: task.new_record? ? 'Create Task' : 'Update Task' %>
    <%= link_to 'Cancel', tasks_path, class: 'btn btn-secondary' %>
  </div>
<% end %>
ERB

# Update Tasks controller
file "app/controllers/tasks_controller.rb", <<-RUBY
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.order(:position, :created_at)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.position = Task.maximum(:position).to_i + 1

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully deleted.'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed, :position)
  end
end
RUBY

# Update Task model
file "app/models/task.rb", <<-RUBY
class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }

  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
  scope :ordered, -> { order(:position, :created_at) }

  before_validation :set_defaults

  private

  def set_defaults
    self.completed ||= false
    self.position ||= 0
  end
end
RUBY

# Update application stylesheet to import tasks styles (Propshaft compatible)
append_to_file "app/assets/stylesheets/application.css" do
  "\n@import \"tasks.css\";"
end

# Create migration file for Task model
file "db/migrate/#{Time.now.strftime('%Y%m%d%H%M%S')}_create_tasks.rb", <<-RUBY
class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.integer :position

      t.timestamps
    end
  end
end
RUBY

# After bundle callback
after_bundle do
  # Run migrations
  rails_command "db:create"
  rails_command "db:migrate"

  say "✅ ToDo app created successfully!", :green
  say "🚀 Start your server with: bin/rails server", :green
  say "📋 Visit http://localhost:3000 to see your Trello-inspired ToDo app!", :green
end
