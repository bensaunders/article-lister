class Article
  include ActiveModel

  def self.fetch
    response = Faraday.get(ENV.fetch('ARTICLE_FILE_LOCATION'))
    article_list = response.body
  rescue Faraday::Error
    article_list = '[]'
  ensure
    return JSON.parse(article_list)
  end
end
