require 'rails_helper'

RSpec.describe Sun, stage: :alpha do

  it { should have_many(:planets) }
end
