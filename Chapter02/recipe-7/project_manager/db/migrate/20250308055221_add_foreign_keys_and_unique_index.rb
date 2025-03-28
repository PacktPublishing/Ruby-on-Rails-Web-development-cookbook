class AddForeignKeysAndUniqueIndex < ActiveRecord::Migration[8.0]
  def change
    # Add foreign key for tasks with cascade delete
    add_foreign_key :tasks, :projects, on_delete: :cascade

    # Add foreign keys for assignments with cascade delete for projects
    add_foreign_key :assignments, :projects, null: false, on_delete: :cascade
    add_foreign_key :assignments, :employees, null: false

    # Add optional foreign key for support tickets
    add_foreign_key :support_tickets, :employees, null: true

    # Add unique index for project-employee assignments
    add_index :assignments, [:project_id, :employee_id], unique: true
  end
end
