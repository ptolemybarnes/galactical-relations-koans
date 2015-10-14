### Epsilon

The solution to this is really simple as the relationships we need already exist at the database level. We just need to tell our models about them:

```ruby
class Moon < ActiveRecord::Base
  belongs_to :planet
  has_one :sun, through: :planet
end

class Sun < ActiveRecord::Base
  has_many :planets
  has_many :moons, through: :planets
end
```

