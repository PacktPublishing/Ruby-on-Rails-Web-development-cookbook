class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.date :due_date, null: false
      t.string :status, null: false, default: 'pending'
      t.references :project, null: false

      t.timestamps
    end
  end
end
