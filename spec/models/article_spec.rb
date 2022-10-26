require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article_list) do
    '[
      {
        "id": 123,
        "title": "Ambipur plugin",
        "reactions": {
          "likes": 20
        }
      }
    ]'
  end

  before do
    stub_request(
      :get,
      ENV.fetch('ARTICLE_FILE_LOCATION')
    ).to_return(status: 200, body: article_list)
  end

  describe '#fetch' do
    context 'when the article file is unavailable' do
      before do
        stub_request(
          :get,
          ENV.fetch('ARTICLE_FILE_LOCATION')
        ).to_raise(Faraday::Error)
      end

      it 'returns an empty array' do
        expect(Article.fetch).to eq([])
      end
    end

    context 'when the article file can be fetched' do
      it 'returns an array' do
        expect(Article.fetch).to be_an Array
      end

      it 'returns an array of Articles' do
        expect(Article.fetch.first).to be_an Article
      end
    end
  end

  describe 'Article objects' do
    let(:article) { Article.fetch.first }

    it 'has an ID' do
      expect(article.id).to eq(123)
    end

    it 'has a likes count' do
      expect(article.likes).to eq(20)
    end

    it 'has a details hash' do
      expect(article.details).to be_a(Hash)
    end

    it 'allows the details to be fetched' do
      expect(article.details['title']).to eq('Ambipur plugin')
    end
  end
end
