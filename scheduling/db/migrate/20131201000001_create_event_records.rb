class CreateEventRecords < ActiveRecord::Migration
  def change
    create_table :event_records do |t|
      t.integer :event_stream_id
      t.string :name
      t.text :args

      t.timestamps
    end
  end
end