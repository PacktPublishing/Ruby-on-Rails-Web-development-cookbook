class Course < ApplicationRecord
  def enrollable?
    Time.now.to_date <= enrollment_closes_on
  end
end
