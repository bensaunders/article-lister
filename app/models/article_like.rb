# frozen_string_literal: true

class ArticleLike < ApplicationRecord
  validates :article_id, uniqueness: true
end
