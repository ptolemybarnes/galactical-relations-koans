require 'rails_helper'

RSpec.describe Sun, stage: :alpha do

  it 'is circled by many planets', stage: :alpha do
    expect(subject).to have_many :planets
  end

  it 'is circled by many moons, via planets', stage: :delta do
    expect(subject).to have_many :moons
  end

end
