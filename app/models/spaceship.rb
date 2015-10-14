class Spaceship < ActiveRecord::Base
  has_many :crewings
  has_many :astronauts, through: :crewings

  def captain
    crewings.where(captain: true).first.astronaut
  end
end
