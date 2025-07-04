class AddUserToProjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :projects, :user, null: false, foreign_key: true
  end
end