class CreateRealtimeBotHashTagTrackings < ActiveRecord::Migration
  def change
    create_table :realtime_bot_hash_tag_trackings do |t|
      t.integer :bot_id,        null: false
      t.integer :bot_type
      t.text :content
      t.boolean :deleted,       null: false,       default: false

      t.timestamps null: false
    end
  end
end
