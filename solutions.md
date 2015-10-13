### Alpha
```
rails g migration AddSunToPlanets sun:references
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

