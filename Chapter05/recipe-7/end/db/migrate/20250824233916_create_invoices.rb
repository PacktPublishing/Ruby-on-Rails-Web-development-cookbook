class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.integer :amount_cents
      t.string :currency

      t.timestamps
    end
  end
end
