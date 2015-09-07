class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id, null: false
      t.integer :bot_id, null: false
      t.time :time, null: false
      t.integer :weekday, precision: 1, null: false

      t.timestamps null: false

      t.index :user_id, unique: true, name: 'by_user_id'
      t.index :bot_id, unique: true, name: 'by_bot_id'
    end
  end
end
