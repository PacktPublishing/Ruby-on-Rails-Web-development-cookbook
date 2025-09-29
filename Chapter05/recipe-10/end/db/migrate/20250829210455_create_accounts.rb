class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.integer :balance_cents, default: 0

      t.timestamps
    end
  end
end
