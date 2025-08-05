class SitemapsController < ApplicationController
  def index
    @articles = Article.published.order(:updated_at)
    
    respond_to do |format|
      format.xml { render layout: false }
    end
  end
end