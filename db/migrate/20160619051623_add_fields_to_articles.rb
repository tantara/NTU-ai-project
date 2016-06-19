class AddFieldsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :section, :string
    add_column :articles, :reporter, :string
    add_column :articles, :media, :string
    add_column :articles, :abstract, :string
  end
end
