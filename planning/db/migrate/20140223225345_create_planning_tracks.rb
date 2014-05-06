class CreatePlanningTracks < ActiveRecord::Migration
  def change
    create_table :planning_tracks do |t|
      t.integer :id
      t.string :name
      t.integer :conference_id

      t.timestamps
    end
  end
end
