require "test_helper"

class EnrollmentTimeTest < ActiveSupport::TestCase
  test "course is enrollable till the closing date" do
    course = Course.new(enrollment_closes_on: Date.new(2025, 8, 31))

    travel_to Time.parse("2025-08-31 23:58:00 -05:00") do
      assert course.enrollable?
    end
  end

  test "created_at equals now" do
    freeze_time do
      course = Course.create!
      assert_equal Time.zone.now, course.created_at
    end
  end
end
