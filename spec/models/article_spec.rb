require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'fetches articles' do
    expect(Article.fetch).to eq([])
  end
end
