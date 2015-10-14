class Astronaut < ActiveRecord::Base
  has_many :crewings
  has_many :spaceships, through: :crewings

  def spaceship
    crewings.where(captain: true).first.spaceship
  end
end
