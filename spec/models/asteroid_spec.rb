require 'rails_helper'

RSpec.describe Asteroid do

  it 'circles many planets', stage: :gamma do
    expect(subject).to have_many(:planets)
  end

end
