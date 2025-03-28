class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :employees, through: :assignments

  validates :name, presence: true
  validates :start_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending active completed on_hold cancelled] }
  validate :end_date_after_start_date, if: -> { end_date.present? }

  private

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end 