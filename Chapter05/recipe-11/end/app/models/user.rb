class User < ApplicationRecord
  def suspend!(at: Time.current, reason: nil)
    update!(suspended_at: at, suspension_reason: reason)
  end

  def suspended?
    suspended_at.present?
  end
end