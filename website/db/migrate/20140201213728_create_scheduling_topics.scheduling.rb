# This migration comes from scheduling (originally 20140130060055)
class CreateSchedulingTopics < ActiveRecord::Migration
  def change
    create_table :scheduling_topics do |t|
      t.integer :id
      t.string :title
      t.text :overview
      t.string :status
      t.integer :conference_id

      t.timestamps
    end
  end
end
