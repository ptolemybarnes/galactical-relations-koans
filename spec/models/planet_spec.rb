require 'rails_helper'

RSpec.describe Planet do

  context '', stage: :alpha do
    it { should belong_to(:sun) }
  end

  context '', stage: :beta do
    it { should have_many(:moons) }
  end

  context 'a planet is visited by many asterioids', stage: :gamma do
    it { should have_many(:asteroids) }
  end

end
