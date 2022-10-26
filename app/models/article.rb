# frozen_string_literal: true

class Article
  include ActiveModel::API

  attr_accessor :details, :id

  class << self
    def fetch
      begin
        response = Faraday.get(ENV.fetch('ARTICLE_FILE_LOCATION'))
        article_list_as_text = response.body
      rescue Faraday::Error
        article_list_as_text = '[]'
      ensure
        article_list_as_hashes = JSON.parse(article_list_as_text)
      end
      article_list_as_hashes.map { |article_hash| new_from_hash(article_hash) }
    end

    private

    def new_from_hash(hash)
      Article.new(
        id: hash['id'],
        details: hash
      )
    end
  end

  def dynamic_like?
    ArticleLike.find_by(article_id: id)
  end

  def likes
    static_likes = details['reactions']['likes']
    static_likes += 1 if dynamic_like?
    static_likes
  end

  def add_like
    ArticleLike.find_or_create_by(article_id: id)
  end
end
