# This migration comes from scheduling (originally 20131201000002)
class CreateIdCounters < ActiveRecord::Migration
  def change
    create_table :id_counters do |t|
      t.integer :id
      t.string :scope
      t.integer :value

      t.timestamps
    end

    add_index :id_counters, :scope, unique: true
  end
end
