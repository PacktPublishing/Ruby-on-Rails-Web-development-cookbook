class ArticlesController < ApplicationController
  before_action :find_article, only: [:show]
  
  def index
    @articles = Article.published.recent
    @featured_article = @articles.first
    @recent_articles = @articles.offset(1).limit(10)
    @categories = Article.published.distinct.pluck(:category).compact
  end

  def show
  end
  
  private
  
  def find_article
    @article = Article.published.find_by!(slug: params[:slug])
  end
end
