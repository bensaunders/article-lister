require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article_list) { '[]' }

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
      before do
        stub_request(
          :get,
          ENV.fetch('ARTICLE_FILE_LOCATION')
        ).to_return(status: 200, body: article_list)
      end

      it 'returns an array' do
        expect(Article.fetch).to be_an Array
      end
    end
  end
end
