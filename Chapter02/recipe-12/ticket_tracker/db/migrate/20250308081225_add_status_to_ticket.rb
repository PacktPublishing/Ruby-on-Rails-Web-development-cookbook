class AddStatusToTicket < ActiveRecord::Migration[8.0]
  def change
    add_column :tickets, :status, :integer, default: 0
  end
end
