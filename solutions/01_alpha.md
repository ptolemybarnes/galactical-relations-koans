### Alpha
```
rails g migration AddSunToPlanets sun:references
```

...which should generate a migration file that looks like this:

```ruby
class AddSunToPlanets < ActiveRecord::Migration
  def change
    add_reference :planets, :sun, index: true, foreign_key: true
  end
end
```

Then, implement the relationships at the model-level like so:

```ruby
class Planet < ActiveRecord::Base
  belongs_to :sun
end

class Sun < ActiveRecord::Base
  has_many :planets
end
```

Now our tests should pass.

```ruby

========= STAGE ALPHA =========
In the first stage, let's declare the relationship between the Sun and Planets. Suns should have many planets. And planets should belong to a sun

Run options: include {:stage=>:alpha}

Galactical Relations Koans
  Alpha
    A planet orbits a single sun
    A sun circled by many planets

Finished in 0.08211 seconds (files took 2.02 seconds to load)
2 examples, 0 failures

```

Go [here](http://stackoverflow.com/questions/22815009/add-a-reference-column-migration-in-rails-4) for more info.
