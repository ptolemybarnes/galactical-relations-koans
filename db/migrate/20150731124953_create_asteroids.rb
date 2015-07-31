class CreateAsteroids < ActiveRecord::Migration
  def change
    create_table :asteroids do |t|

      t.timestamps null: false
    end
  end
end
