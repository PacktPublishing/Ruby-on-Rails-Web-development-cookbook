# frozen_string_literal: true

require "test_helper"

class CoursesIndexBenchTest < ActionDispatch::IntegrationTest
  # Tip: run with a single worker for stability:
  #   PARALLEL_WORKERS=1 bin/rails test test/performance/courses_index_bench_test.rb
  # 
  # Add tests here:

  setup { seed_data(courses: 10_000, instructors: 150) }

  test "GET /courses benchmark" do
    result = bench_request(runs: 7, warmup: 1) do
      get "/courses"
      assert_response :success
    end

    display_benchmark_results(result)
    assert_performance_threshold(result[:median])
  end

  private

  def seed_data(courses:, instructors:)
    clean_database
    create_instructors(instructors)
    create_courses(courses)
  end

  def clean_database
    Course.delete_all
    Instructor.delete_all
  end

  def create_instructors(count)
    instructor_records = build_instructor_records(count)
    Instructor.insert_all!(instructor_records)
  end

  def create_courses(count)
    instructor_ids = Instructor.order(:id).pluck(:id)
    course_records = build_course_records(count, instructor_ids)
    Course.insert_all!(course_records)
  end

  def build_instructor_records(count)
    timestamp = Time.current
    Array.new(count) do |i|
      {
        name: "Instructor #{i}",
        created_at: timestamp,
        updated_at: timestamp
      }
    end
  end

  def build_course_records(count, instructor_ids)
    timestamp = Time.current
    Array.new(count) do |i|
      {
        title: "Course #{i}",
        description: "Description #{i}",
        credits: 3,
        duration: 15,
        instructor_id: instructor_ids[i % instructor_ids.size],
        created_at: timestamp,
        updated_at: timestamp
      }
    end
  end

  def display_benchmark_results(result)
    puts format_benchmark_output(result)
  end

  def format_benchmark_output(result)
    <<~OUTPUT

      🏃 GET /courses Performance Results:
         Runs:     #{result[:runs]} samples
         Median:   #{format("%.4f", result[:median])}s
         95th %:   #{format("%.4f", result[:p95])}s
         Min:      #{format("%.4f", result[:min])}s
         Max:      #{format("%.4f", result[:max])}s
    OUTPUT
  end

  def assert_performance_threshold(median_time)
    threshold = 0.01
    assert median_time < threshold,
      "Expected median < #{threshold}s, got #{median_time}s"
  end
end
