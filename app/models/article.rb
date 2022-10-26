class Article
  include ActiveModel::API

  attr_accessor :details, :id

  def self.fetch
    begin
      response = Faraday.get(ENV.fetch('ARTICLE_FILE_LOCATION'))
      article_list_as_text = response.body
    rescue Faraday::Error
      article_list_as_text = '[]'
    ensure
      article_list_as_hashes = JSON.parse(article_list_as_text)
    end
    article_list_as_hashes.map do | article_hash |
      Article.new(
        id: article_hash['id'],
        details: article_hash
      )
    end
  end
end
