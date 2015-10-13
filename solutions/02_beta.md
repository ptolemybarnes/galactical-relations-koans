### Beta

```
rails g migration AddPlanetToMoon planet:belongs_to
```

Which will generate a migration file looking like this:

```ruby
class AddPlanetToMoon < ActiveRecord::Migration
  def change
    add_reference :moons, :planet, index: true, foreign_key: true
  end
end
```

Then, implement the relationships at the model-level like so:

```ruby
class Planet < ActiveRecord::Base
  has_many :moons
end

class Moon < ActiveRecord::Base
  belongs_to :planet
end
```

Now our tests should pass. ^_^

```
========= STAGE BETA =========
Next up, planets have many moons and moons belong to a planet.

Run options: include {:stage=>:beta}

Galactical Relations Koans
  Beta
      A planet circled by many moons
          A moon circles a single planet

          Finished in 0.06435 seconds (files took 2.14 seconds to load)
          2 examples, 0 failures
```

