require 'rails_helper'

RSpec.describe Sun, type: :model do

  it { should have_many(:planets) }
end
