# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'

roles = %i(consumer producer)

derek = SocialUser.create!(name: 'Derek Stride', role: :consumer)
human = SocialUser.create!(name: 'Human', role: :consumer)
zombie = SocialUser.create!(name: 'Zombie', role: :producer)
1000.times do
  SocialUser.create!(name: FFaker::Name.name, role: roles.sample)
end

coding = Tag.create!(tag: 'coding')
netflix = Tag.create!(tag: 'netflix')
health = Tag.create!(tag: 'health')

100.times do
  Tag.create!(tag: FFaker::Skill.specialty)
  Tag.create!(tag: FFaker::Skill.tech_skill)
  Tag.create!(tag: FFaker::Sport.name)
  Tag.create!(tag: FFaker::Product.product)
  Tag.create!(tag: FFaker::Food.ingredient)
  Tag.create!(tag: FFaker::Music.genre)
  Tag.create!(tag: FFaker::Movie.title)
end

zombie.followers << human
derek.followers << human
derek.followers << zombie

derek.tags << coding << health << netflix
zombie.tags << health
human.tags << netflix
