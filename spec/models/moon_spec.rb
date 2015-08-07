require 'rails_helper'

RSpec.describe Moon do

  it 'circles a single planet', stage: :beta do
    expect(subject).to belong_to :planet
  end

  it 'has a single sun', stage: :delta do
    expect(subject).to have_one :sun 
  end

end
