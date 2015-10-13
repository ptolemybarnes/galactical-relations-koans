require 'rails_helper' 

describe 'Galactical Relations Koans' do

  let(:sun)      { Sun.create    }
  let(:planet)   { Planet.create }
  let(:moon)     { Moon.create   }
  let(:asteroid) { Asteroid.create }

  describe 'Alpha' do

    it 'A planet orbits a single sun', stage: :alpha do
      expect(planet).to belong_to(:sun)

      planet = Planet.create(sun: sun)
      expect(planet.sun).to eq sun
    end


    it 'A sun circled by many planets', stage: :alpha do
      expect(sun).to have_many :planets

      sun.planets << planet
      sun.save!

      expect(sun.planets).to include(planet)
    end

  end

  describe 'Beta' do

    it 'A planet circled by many moons', stage: :beta do
      expect(planet).to have_many :moons

      planet.moons << moon
      planet.save!

      expect(planet).to have_many(:moons)
    end

    it 'A moon circles a single planet', stage: :beta do
      expect(moon).to belong_to :planet
    end

  end

  describe 'Gamma' do

    it 'A planet is circled by many asteroids', stage: :gamma do
      expect(planet).to have_and_belong_to_many(:asteroids)

      planet.asteroids << asteroid
      planet.save!

      expect(planet.asteroids).to include(asteroid)
    end

    it 'An asteroid circles many planets', stage: :gamma do
      expect(asteroid).to have_and_belong_to_many(:planets)

      planets = [ 
        earth = Planet.create,
        mars  = Planet.create
      ]

      vesta = Asteroid.create
      ceres = Asteroid.create

      earth.asteroids << vesta
      mars.asteroids << vesta
      mars.asteroids << ceres


      planets.each(&:reload)

      earth.reload
      expect(earth.asteroids).to     include(vesta)
      expect(earth.asteroids).not_to include(ceres)

      [vesta, ceres].each do |asteroid|
        asteroid.reload
        expect(mars.asteroids).to include asteroid
      end
    end

  end

  describe 'Delta' do

    let(:shapeship) { Shapeship.create }
    let(:captain  ) { Astronaut.create }

    it 'A spaceship has many astronauts, one of whom is the captain', stage: :delta do
      Crewing.create(spaceship: spaceship, astronaut: Astronaut.create)
      Crewing.create(spaceship: spaceship, astronaut: Astronaut.create)
      Crewing.create(spaceship: spaceship, astronaut: captain , captain: true)

      expect(spaceship.astronauts.size).to eq 3 
      expect(shapeship.captain).to eq captain
    end

    it 'Astronauts crew many spaceships, and can serve as captain of one of them', stage: :delta do
      Crewing.create(spaceship: spaceship, astronaut: captain , captain: true)

      expect(captain.spaceship).to eq(shapeship)
    end

  end

  describe 'Epsilon' do

    it 'A sun is circled by many moons, via planets', stage: :epsilon do
      expect(sun).to have_many :moons

      planet = sun.planets.create
      moon   = planet.moons.create

      expect(sun.moons).to include(moon)
    end

    it 'A moon has a single sun, via its planet', stage: :epsilon do
      expect(moon).to have_one :sun 

      planet = sun.planets.create
      moon   = planet.moons.create

      expect(moon).not_to have_db_column(:sun_id)
      expect(moon.sun).to eq(sun)
    end

  end

end

