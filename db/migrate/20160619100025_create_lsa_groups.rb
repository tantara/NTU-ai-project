class CreateLsaGroups < ActiveRecord::Migration
  def change
    create_table :lsa_groups do |t|
      t.string :gid

      t.timestamps null: false
    end

    add_index :lsa_groups, :gid
  end
end
