class AddCountToTables < ActiveRecord::Migration
  def change
    add_column :keywords, :count, :integer, :default => 0
    add_column :articles, :count, :integer, :default => 0
  end
end
