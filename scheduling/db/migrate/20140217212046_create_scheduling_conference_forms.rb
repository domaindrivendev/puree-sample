class CreateSchedulingConferenceForms < ActiveRecord::Migration
  def change
    create_table :scheduling_conference_forms do |t|
      t.string :name
      t.text :description
      t.date :date
      t.string :location

      t.timestamps
    end
  end
end
