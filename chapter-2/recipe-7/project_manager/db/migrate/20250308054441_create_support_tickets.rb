class CreateSupportTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :support_tickets do |t|
      t.string :title, null: false
      t.text :description
      t.string :status, null: false, default: 'open'
      t.string :priority, null: false, default: 'medium'
      t.references :employee

      t.timestamps
    end
  end
end
