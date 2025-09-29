class CoursesController < ApplicationController
  def index
    @courses = Course.all
    render json: @courses.as_json(include: :instructor)
  end
end
