### Gamma

Let's approach this the other way around, declaring the association on the models first:

```ruby
class Asteroid < ActiveRecord::Base
  has_and_belongs_to_many :planets
end

class Planet < ActiveRecord::Base
  # etc
  has_and_belongs_to_many :asteroids
end
```

Running our tests now, we get an interesting error message:

```

========= STAGE GAMMA =========
Let's implement a basic many-to-many connection between planets and asteroids. The most straightforward way of implementing this association is with a join table.

Run options: include {:stage=>:gamma}

Galactical Relations Koans
  Gamma
    A planet is circled by many asteroids (FAILED - 1)
    An asteroid circles many planets (FAILED - 2)

Failures:

  1) Galactical Relations Koans Gamma A planet is circled by many asteroids
     Failure/Error: expect(planet).to have_and_belong_to_many(:asteroids)
       Expected Planet to have a has_and_belongs_to_many association called asteroids (join table asteroids_planets doesn't exist)
     # ./spec/galactical_relations_koans_spec.rb:51:in `block (3 levels) in <top (required)>'

  2) Galactical Relations Koans Gamma An asteroid circles many planets
     Failure/Error: expect(asteroid).to have_and_belong_to_many(:planets)
       Expected Asteroid to have a has_and_belongs_to_many association called planets (join table asteroids_planets doesn't exist)
     # ./spec/galactical_relations_koans_spec.rb:60:in `block (3 levels) in <top (required)>'

Finished in 0.05378 seconds (files took 1.96 seconds to load)
2 examples, 2 failures

Failed examples:

rspec ./spec/galactical_relations_koans_spec.rb:50 # Galactical Relations Koans Gamma A planet is circled by many asteroids
rspec ./spec/galactical_relations_koans_spec.rb:59 # Galactical Relations Koans Gamma An asteroid circles many planets
```

The interesting line here is `join table asteroids_planets doesn't exist`. With a `has_and_belongs_to_many` relationship, Rails infers that there should be a join table connecting the two models. By convention, it should be named after the two resources it is joining.

Rails provides a way of generating join tables for HABTM relationships: `rails g migration create_join_table asteroid planet`. This migration looks like: 

```ruby
class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :asteroids, :planets do |t|
      # t.index [:asteroid_id, :planet_id]
      # t.index [:planet_id, :asteroid_id]
    end
  end
end
```

The body of the migration is commented out. Uncomment them and the migration will run.

