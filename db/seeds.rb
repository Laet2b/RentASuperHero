# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'faker'

puts 'Creating 3 fake users'
3.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
    )
  user.save!
end

heros = [70, 322, 333, 332, 505]

url = "https://superheroapi.com/api/6256070421085368"


heros.each do |hero|
hero_json = JSON.parse("#{url}/#{hero}/biography")
hero_category = JSON.parse("#{url}/#{hero}/work")
hero_picture = JSON.parse("#{url}/#{hero}/image")
hero = Hero.new(
  name: hero_json['name']
  category: hero_category['occupation']
  user_id: [1, 2, 3].sample
  fullname: hero_json['full-name']
  publisher: hero_json['publisher']
  alignment: hero_json['alignment']
  picture: hero_picture['url']
  )
hero.save!
end
