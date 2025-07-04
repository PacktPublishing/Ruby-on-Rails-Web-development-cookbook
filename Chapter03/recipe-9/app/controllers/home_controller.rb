class HomeController < ApplicationController
  # GET /
  allow_unauthenticated_access only: :index
  def index
  end
end