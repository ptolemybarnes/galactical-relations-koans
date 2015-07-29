class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|

      t.timestamps null: false
    end
  end
end
