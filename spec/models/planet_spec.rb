require 'rails_helper'

RSpec.describe Planet, type: :model do

  it { should belong_to(:sun) }

end
