class CreateMilestones < ActiveRecord::Migration[8.0]
  def change
    create_table :milestones do |t|
      t.string :title
      t.boolean :completed
      t.date :due_on
      t.boolean :blocked

      t.timestamps
    end
  end
end
