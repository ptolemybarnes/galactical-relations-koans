require 'rails_helper'

RSpec.describe Planet do

  it 'orbits a single sun', stage: :alpha do
    expect(subject).to belong_to(:sun)
  end

  it 'is circled by many moons', stage: :beta do
    expect(subject).to have_many(:moons) }
  end

  it 'is circled by many asteroids', stage: :gamma do
    expect(subject).to have_many(:asteroids) }
  end

end
