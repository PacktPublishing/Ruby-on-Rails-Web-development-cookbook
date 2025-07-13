class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :timezone
      t.boolean :public
      t.date :date_of_birth

      t.timestamps
    end
  end
end
