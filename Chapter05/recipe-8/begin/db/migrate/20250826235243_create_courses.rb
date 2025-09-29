class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :duration
      t.integer :credits
      t.references :instructor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
