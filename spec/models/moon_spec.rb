require 'rails_helper'

RSpec.describe Moon do

  context '', stage: :beta do
    it { should belong_to :planet }
  end

end
