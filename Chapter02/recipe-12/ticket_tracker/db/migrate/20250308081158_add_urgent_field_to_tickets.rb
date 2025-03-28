class AddUrgentFieldToTickets < ActiveRecord::Migration[8.0]
  def change
    add_column :tickets, :urgent, :boolean, default: false
  end
end
