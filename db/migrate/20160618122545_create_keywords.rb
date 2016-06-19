class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :name, :unique => true

      t.timestamps null: false
    end

    add_index :keywords, :name, :unique => true
  end
end
