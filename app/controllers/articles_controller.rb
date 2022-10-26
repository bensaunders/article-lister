class ArticlesController < ApplicationController
  def index
    @articles = Article.fetch
  end
end
