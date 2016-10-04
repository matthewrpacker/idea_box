# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Idea.destroy_all

Idea.create(title: "First Idea", body: "This is the first idea body.", quality: 0)
puts "First idea created"
Idea.create(title: "Second Idea", body: "This is the second idea body.", quality: 1)
puts "Second idea created"
Idea.create(title: "Third Idea", body: "This is the third idea body.", quality: 2)
puts "Third idea created"
Idea.create(title: "Fourth Idea", body: "This is the fourth idea body.", quality: 0)
puts "Fourth idea created"
Idea.create(
  title: "Fifth Idea",
  body: "This is a bad idea.  Maybe this idea should not be recorded, but I am recording it because you never know.",
  quality: 1
)
puts "Fifth idea created"
