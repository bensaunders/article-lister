class ArticleLike < ApplicationRecord
  validates :article_id, uniqueness: true
end
