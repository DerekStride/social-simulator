# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'

simulation = Simulation.create!

roles = %w(Consumer Producer)

derek = Consumer.create!(name: 'Derek Stride', simulation: simulation)
human = Producer.create!(name: 'Human', simulation: simulation)
zombie = Consumer.create!(name: 'Zombie', simulation: simulation)
1000.times do
  SocialUser.create!(name: FFaker::Name.name, role: roles.sample, simulation: simulation)
end

coding = Tag.create!(tag: 'coding', simulation: simulation)
netflix = Tag.create!(tag: 'netflix', simulation: simulation)
health = Tag.create!(tag: 'health', simulation: simulation)

100.times do
  Tag.create!(tag: FFaker::Skill.specialty, simulation: simulation)
  Tag.create!(tag: FFaker::Skill.tech_skill, simulation: simulation)
  Tag.create!(tag: FFaker::Sport.name, simulation: simulation)
  Tag.create!(tag: FFaker::Product.product, simulation: simulation)
  Tag.create!(tag: FFaker::Food.ingredient, simulation: simulation)
  Tag.create!(tag: FFaker::Music.genre, simulation: simulation)
  Tag.create!(tag: FFaker::Movie.title, simulation: simulation)
end

photo = Content.create!(name: 'Pretty Photo', producer: human, simulation: simulation)
document = Content.create!(name: 'Formal Report', producer: human, simulation: simulation)

1250.times do
  Content.create!(name: FFaker::HipsterIpsum.word, producer: Producer.order('RANDOM()').limit(1).first)
end

# Adding tags to models

document.tags << coding
photo.tags << netflix << health

derek.tags << coding << health << netflix
zombie.tags << health
human.tags << netflix

# Adding followers

human.followers << zombie
derek.followers << human
derek.followers << zombie

# Adding likes

photo.likes << zombie
document.likes << derek << human
