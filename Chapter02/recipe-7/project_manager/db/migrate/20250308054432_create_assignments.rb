class CreateAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :assignments do |t|
      t.references :employee, null: false
      t.references :project, null: false
      t.string :role, null: false, default: 'member'

      t.timestamps
    end
  end
end
