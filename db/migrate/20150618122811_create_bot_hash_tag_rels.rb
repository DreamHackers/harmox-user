class CreateBotHashTagRels < ActiveRecord::Migration
  def change
    create_table :bot_hash_tag_rels do |t|
      t.integer :bot_id
      t.integer :hash_tag_id
      t.boolean :deleted,       null: false,       default: false

      t.timestamps null: false
    end
  end
end
