require 'rails_helper'

RSpec.describe Planet, stage: :alpha do

  it { should belong_to(:sun) }

end
