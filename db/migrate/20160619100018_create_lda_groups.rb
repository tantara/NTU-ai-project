class CreateLdaGroups < ActiveRecord::Migration
  def change
    create_table :lda_groups do |t|
      t.string :gid

      t.timestamps null: false
    end

    add_index :lda_groups, :gid
  end
end
