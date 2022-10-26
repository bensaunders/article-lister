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
          },
          'location' => {
            'latitude' => 0,
            'longitude' => 0
          },
          'photos' => [
            {
              'files' => {
                'medium' => 'https://cdn.example.com/img1.jpg'
              }
            }
          ]
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

  describe "GET /articles/:id/like" do
    context "when the article does not have a dynamic like" do
      it "creates an ArticleLike" do
        expect(ArticleLike.find_by(article_id: 456)).to be_nil
        get "/articles/456/like"
        expect(ArticleLike.find_by(article_id: 456)).not_to be_nil
      end
    end

    context "when the article already has a dynamic like" do
      before do
        ArticleLike.create(article_id: 567)
      end

      it "does not create another ArticleLike" do
        likes_before = ArticleLike.where(article_id: 567).count
        get "/articles/567/like"
        likes_after = ArticleLike.where(article_id: 567).count
        expect(likes_after).to eq(likes_before)
      end
    end
  end
end
