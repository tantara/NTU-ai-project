class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :headline
      t.string :url
      t.string :nid, :unique => true
      t.datetime :published_at

      t.timestamps null: false
    end

    add_index :articles, :nid, :unique => true
  end
end
