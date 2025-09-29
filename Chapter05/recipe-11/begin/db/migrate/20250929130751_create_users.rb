class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.datetime :suspended_at
      t.text :suspension_reason

      t.timestamps
    end
  end
end
