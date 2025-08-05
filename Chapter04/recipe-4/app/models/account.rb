class Account < ApplicationRecord
  has_many :users, inverse_of: :account

  validates :name, presence: true

  accepts_nested_attributes_for :users, limit: 1
end
