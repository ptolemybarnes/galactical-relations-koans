# Rails Migration Koans
Confused about db relationships and writing migrations in Rails? These koans are intended as a learning tool just for you.

### Instructions
1. Clone the repository.
2. Make the tests pass. [This](http://edgeguides.rubyonrails.org/active_record_migrations.html#writing-a-migration) might help.

### The Domain
== Level 1 ==
In the domain we have: planets, moon, and suns.
- Suns have many planets.
- Planets belongs to a sun.
- Planets have many moons.
- Moons belong to a planet and a sun.

== Level 2 ==
In the domain we have: planets and asteroids
- Planets have many asteroids.
- Asteroids have many planets.

== Level 2 ==
In the domain we have: planets, moon, and suns.
- Suns have many planets, moons, and comets through Orbitings
- Planets have many moons through Orbitings.
- Moons belongs to a planet through an orbiting.

### To do
- Set up a rake tasks that leads students progressively through problems.
- Write more koans for other kinds of relationships.
