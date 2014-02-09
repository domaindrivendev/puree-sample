class CreateAccessControlFoobars < ActiveRecord::Migration
  def change
    create_table :access_control_foobars do |t|

      t.timestamps
    end
  end
end
