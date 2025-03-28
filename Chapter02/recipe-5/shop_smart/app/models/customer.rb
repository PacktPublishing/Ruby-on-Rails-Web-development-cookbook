class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :loyalty_points, numericality: { greater_than_or_equal_to: 0 }
end
