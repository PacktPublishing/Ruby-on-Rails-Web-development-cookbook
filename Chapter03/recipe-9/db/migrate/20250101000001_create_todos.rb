class CreateTodos < ActiveRecord::Migration[8.0]
  def change
    create_table :todos do |t|
      t.string :content, null: false
      t.boolean :completed, default: false, null: false
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end