class SplitAddressIntoParts < ActiveRecord::Migration[8.0]
  def up
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string

    User.reset_column_information

    User.find_each do |user|
      next if user.address.blank?

      street, city, state, zip_code = parse_address(user.address)

      user.update!(street: street,
        city: city,
        state: state,
        zip_code: zip_code)
    end

    remove_column :users, :address
  end

  def down
    add_column :users, :address, :text

    User.reset_column_information

    User.find_each do |user|
      user.update!(address: "#{user.street}, #{user.city}, #{user.state}, #{user.zip_code}")
    end

    remove_column :users, :street, :string
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :zip_code, :string
  end

  private

  def parse_address(address)
    address.split(",").each(&:strip!)
  end
end
