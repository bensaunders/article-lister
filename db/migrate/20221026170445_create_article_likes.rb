class CreateArticleLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :article_likes do |t|
      t.integer :article_id

      t.timestamps
    end
  end
end
