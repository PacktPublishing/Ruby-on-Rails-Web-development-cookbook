class Employee < ApplicationRecord
  has_many :assignments
  has_many :projects, through: :assignments
  has_many :support_tickets

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end 