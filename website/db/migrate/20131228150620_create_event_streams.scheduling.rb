# This migration comes from scheduling (originally 20131201000000)
class CreateEventStreams < ActiveRecord::Migration
  def change
    create_table :event_streams do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end

    add_index :event_streams, :name, unique: true
  end
end
