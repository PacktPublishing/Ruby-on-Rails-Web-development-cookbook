class CoursesController < ApplicationController
  def index
    @courses = Course.includes(:instructor).all
    render json: @courses.as_json(include: :instructor)
  end
end
