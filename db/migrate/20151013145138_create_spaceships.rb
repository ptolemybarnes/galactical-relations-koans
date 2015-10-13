class CreateSpaceships < ActiveRecord::Migration
  def change
    create_table :spaceships do |t|

      t.timestamps null: false
    end
  end
end
