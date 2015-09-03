class Planet < ActiveRecord::Base
  has_many :moons
end
