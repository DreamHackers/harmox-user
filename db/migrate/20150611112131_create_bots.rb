class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.integer :user_id,       null: false
      t.string  :twitter_name
      t.string  :twitter_id,    null: false
      t.string  :access_token
      t.string  :access_secret
      t.boolean :deleted,       null: false,       default: false

      t.timestamps              null: false
    end
  end
end
