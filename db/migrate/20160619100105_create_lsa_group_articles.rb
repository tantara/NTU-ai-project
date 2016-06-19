class CreateLsaGroupArticles < ActiveRecord::Migration
  def change
    create_table :lsa_group_articles do |t|
      t.integer :lsa_group_id
      t.integer :article_id

      t.timestamps null: false
    end

    add_index :lsa_group_articles, :lsa_group_id
    add_index :lsa_group_articles, :article_id
  end
end
