class CreateHashTags < ActiveRecord::Migration
  def change
    create_table :hash_tags do |t|
      t.string :hash_tag,       null: false
      t.boolean :deleted,       null: false,       default: false

      t.timestamps null: false
    end
  end
end
