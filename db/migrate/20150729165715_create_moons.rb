class CreateMoons < ActiveRecord::Migration
  def change
    create_table :moons do |t|

      t.timestamps null: false
    end
  end
end
