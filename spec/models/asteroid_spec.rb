require 'rails_helper'

RSpec.describe Asteroid do

  context '', stage: :gamma do
    it { should have_many(:planets) }
  end

end
