# This migration comes from planning (originally 20140218172621)
class CreatePlanningConferences < ActiveRecord::Migration
  def change
    create_table :planning_conferences do |t|
      t.integer :id
      t.string :name
      t.string :description
      t.date :date
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
