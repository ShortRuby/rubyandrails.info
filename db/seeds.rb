# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#

require 'faker'


20.times do |tag|
  Tag.create(title: Faker::Lorem.word)
end

100.times do |book|
  Book.create!(title: Faker::Book.title[0..40], 
               subtitle: Faker::Book.title[0..20], 
               content: Faker::Lorem::paragraph, 
               cover: "rails-novice-to-ninja.jpg", 
               year: Faker::Number.between(from: 2000, to: 2022),
               tag_ids: [] )
end
