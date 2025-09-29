class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.date :enrollment_closes_on

      t.timestamps
    end
  end
end
