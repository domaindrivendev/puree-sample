class CreateSchedulingSessions < ActiveRecord::Migration
  def change
    create_table :scheduling_sessions do |t|
      t.integer :id
      t.string :time_slot
      t.string :title
      t.integer :track_id

      t.timestamps
    end
  end
end
