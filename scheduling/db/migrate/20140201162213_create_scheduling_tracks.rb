class CreateSchedulingTracks < ActiveRecord::Migration
  def change
    create_table :scheduling_tracks do |t|
      t.integer :id
      t.string :name
      t.integer :conference_id

      t.timestamps
    end
  end
end
