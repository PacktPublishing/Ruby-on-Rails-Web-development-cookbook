class Assignment < ApplicationRecord
  belongs_to :employee
  belongs_to :project

  validates :employee_id, presence: true
  validates :project_id, presence: true
  validates :role, presence: true, inclusion: { in: %w[member lead manager admin] }
  validates :employee_id, uniqueness: { scope: :project_id, message: "is already assigned to this project" }
end 