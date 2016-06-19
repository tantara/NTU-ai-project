class AddHiddenToGroups < ActiveRecord::Migration
  def change
    add_column :lsa_groups, :hidden, :boolean, :default => false
    add_column :lda_groups, :hidden, :boolean, :default => false
  end
end
