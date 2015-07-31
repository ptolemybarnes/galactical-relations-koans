require 'rails_helper'

RSpec.describe Asteroid do

  context 'An asteroid traverses the orbits of many planets', stage: :gamma do 
    it { should have_many(:planets) }
  end

end
