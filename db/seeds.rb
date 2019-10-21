# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "faker"

def user
  email = Faker::Internet.email
  name = Faker::FunnyName.name
  password = Faker::Internet.password
  email + " " + name + " " + password
end

def idea
  title = Faker::Hipster.sentence
  body = Faker::Lorem.paragraphs(number: 3).join(" ")
  title + " " + body
end