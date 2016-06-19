class CreateLdaGroupArticles < ActiveRecord::Migration
  def change
    create_table :lda_group_articles do |t|
      t.integer :lda_group_id
      t.integer :article_id

      t.timestamps null: false
    end

    add_index :lda_group_articles, :lda_group_id
    add_index :lda_group_articles, :article_id
  end
end
