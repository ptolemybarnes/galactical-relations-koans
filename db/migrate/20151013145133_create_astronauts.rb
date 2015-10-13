class CreateAstronauts < ActiveRecord::Migration
  def change
    create_table :astronauts do |t|

      t.timestamps null: false
    end
  end
end
