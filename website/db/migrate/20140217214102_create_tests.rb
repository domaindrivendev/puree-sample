class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :foo
      t.string :bar

      t.timestamps
    end
  end
end
