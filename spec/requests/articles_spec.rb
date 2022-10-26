require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:article_list) do
    [
      Article.new(
        id: 456,
        details: {
          'title' => 'Waterproof jacket',
          'reactions' => {
            'likes' => 23
          }
        }
      )
    ]
  end

  before do
    allow(Article)
      .to receive(:fetch)
      .and_return(article_list)
  end

  describe "GET /articles" do
    it "responds with success" do
      get articles_index_path
      expect(response).to have_http_status(200)
    end

    it "displays the article titles" do
      get articles_index_path
      expect(response.body).to include('Waterproof jacket')
    end

    it "displays the number of likes for each article" do
      get articles_index_path
      expect(response.body).to include('Likes: 23')
    end
  end
end
