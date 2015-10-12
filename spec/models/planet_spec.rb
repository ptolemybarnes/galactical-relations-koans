require 'rails_helper'

RSpec.describe Planet do

  let(:sun) { Sun.create }

  it 'orbits a single sun', stage: :alpha do
    planet = Planet.create(sun: sun)
    expect(planet.sun).to eq sun
  end

  it 'is circled by many moons', stage: :beta do
    expect(subject).to have_many(:moons)
  end

  it 'is circled by many asteroids', stage: :gamma do
    expect(subject).to have_many(:asteroids)
  end

end
