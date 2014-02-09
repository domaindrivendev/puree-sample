# This migration comes from scheduling (originally 20131228150515)
class CreateSchedulingConferences < ActiveRecord::Migration
  def change
    create_table :scheduling_conferences do |t|
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
