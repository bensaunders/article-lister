# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticleLike, type: :model do
  it 'has an article_id' do
    like = ArticleLike.new(article_id: 1024)
    expect(like.article_id).to eq(1024)
  end

  it 'can be found by its article_id' do
    ArticleLike.create(article_id: 2048)
    expect(ArticleLike.find_by(article_id: 2048)).not_to be_nil
  end

  it 'is unique by article_id' do
    ArticleLike.create(article_id: 1723)
    expect { ArticleLike.create!(article_id: 1723) }
      .to raise_error(ActiveRecord::RecordInvalid)
  end
end
