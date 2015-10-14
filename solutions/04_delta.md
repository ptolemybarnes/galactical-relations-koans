### Delta

This problem is quite a bit trickier. In the domain we have spaceships and astronauts. Spaceships are crewed by many astronauts and, in turn, each astronaut can crew multiple spaceships. The kicker is that each spaceship has an astronaut who is a captain. In other words, it's possible for astronauts to have a special kind of "captaincy" relationship with a spaceship. As we've identified that this is a property of the **relationship** between a spaceship and an astronaut, we need some way of representing that relationship. This is where the join model comes in.

Let's start by generating the join model, `Crewing`:

```ruby
rails g model crewing astronaut:references spaceship:references captain:boolean
```

This will create both a model and a migration for its table, which will look similar to those of stages alpha and beta:

```ruby
class CreateCrewings < ActiveRecord::Migration
  def change
    create_table :crewings do |t|
      t.references :astronaut, index: true, foreign_key: true
      t.references :spaceship, index: true, foreign_key: true
      t.boolean :captaincy

      t.timestamps null: false
    end
  end
end
```

We've declared a column, "captaincy", which tells us whether the relationship represented by that crewing is one of captaincy or not. The generator also creates a Crewing model that looks like this:

```ruby
class Crewing < ActiveRecord::Base
  belongs_to :astronaut
  belongs_to :spaceship
end
```

To get this working we need to supplement our astronaut and spaceship models as follows:

```ruby
  class Spaceship < ActiveRecord::Base
    has_many :crewings
    has_many :astronauts, through: :crewings
  end

  class Astronaut < ActiveRecord::Base
    has_many :crewings
    has_many :spaceships, through: :crewings
  end
```

This will get the many-to-many relationship up and running. Our tests ask us to implement some methods:

- `Spaceship#captain`, which returns the captain of that ship.
- `Astronaut#spaceship`, which returns the ship that the astronaut is the captain of. 

To do this, you can do the following:

```ruby
class Spaceship < ActiveRecord::Base
  has_many :crewings
  has_many :astronauts, through: :crewings

  def captain
    crewings.where(captain: true).first.astronaut
  end
end

class Astronaut < ActiveRecord::Base
  has_many :crewings
  has_many :spaceships, through: :crewings

  def spaceship
    crewings.where(captain: true).first.spaceship
  end
end
```

