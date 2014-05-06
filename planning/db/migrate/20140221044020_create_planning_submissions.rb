class CreatePlanningSubmissions < ActiveRecord::Migration
  def change
    create_table :planning_submissions do |t|
      t.integer :id
      t.string :title
      t.text :overview
      t.string :status
      t.integer :conference_id

      t.timestamps
    end
  end
end
