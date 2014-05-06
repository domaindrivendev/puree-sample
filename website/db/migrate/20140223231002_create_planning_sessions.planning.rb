# This migration comes from planning (originally 20140223230942)
class CreatePlanningSessions < ActiveRecord::Migration
  def change
    create_table :planning_sessions do |t|
      t.string :start_hour
      t.string :start_min
      t.string :end_hour
      t.string :end_min
      t.integer :submission_id
      t.string :submission_title
      t.integer :track_id

      t.timestamps
    end
  end
end
