class CreateSchedulingConferenceViews < ActiveRecord::Migration
  def change
    create_table :scheduling_conference_views do |t|
      t.integer :id
      t.string :name
      t.text :description
      t.date :date
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
