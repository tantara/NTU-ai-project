class CreateArticleKeywords < ActiveRecord::Migration
  def change
    create_table :article_keywords do |t|
      t.integer :keyword_id
      t.integer :article_id

      t.timestamps null: false
    end

    add_index :article_keywords, :keyword_id
    add_index :article_keywords, :article_id
  end
end
