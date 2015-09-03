class AddPlanetToMoon < ActiveRecord::Migration
  def change
    add_reference :moons, :planet, index: true, foreign_key: true
  end
end
