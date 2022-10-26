# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.fetch
  end

  def like
    @article = Article.new(id: params[:id]).add_like
    redirect_to action: 'index'
  end
end
