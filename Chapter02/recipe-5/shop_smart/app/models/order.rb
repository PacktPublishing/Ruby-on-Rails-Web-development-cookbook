class Order < ApplicationRecord
  belongs_to :customer

  validates :total_price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :status, presence: true

  before_validation :set_default_status, unless: ->(order) { order.status.present? }
  after_create ->(order) { InvoiceService.generate(order) }
  after_commit :send_confirmation_email
  after_save :give_loyalty_points

  private

  def set_default_status
    self.status = "pending"
  end

  def send_confirmation_email
    OrderMailer.with(order: self).confirmation_email.deliver_later
  end

  def give_loyalty_points
    points_awarded = (total_price / 10).to_i
    customer.update(loyalty_points: customer.loyalty_points + points_awarded)
  end
end
