class User < ApplicationRecord
  belongs_to :account
  validates :email, presence: true, format: /@/
  has_secure_password :password
end
