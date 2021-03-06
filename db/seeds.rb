# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'faker'
require 'rest-client'
require_relative "../app/models/user"
require_relative "../app/models/hero"


Review.destroy_all
Booking.destroy_all
Hero.destroy_all
User.destroy_all


  user = User.new(
    email: "bob@gmail.com",
    password: "bobbob"
    )
  user.save!

  user_2 = User.new(
    email: "laetitia@gmail.com",
    password: "laetitia"
    )
  user_2.save!
  user_3 = User.new(
    email: "jack@gmail.com",
    password: "jackjack"
    )
  user_3.save!

url = "https://superheroapi.com/api/6256070421085368"

heros = ["Ethan hunt", "hellboy", "Nova", "Hulk", "Oracle"]

heros.each do |hero|

    hero_json = RestClient.get("#{url}/search/#{hero.gsub(" ", "%20")}")
    hero_json = JSON.parse(hero_json)

    hero = Hero.new(
    name: hero_json["results"][0]['name'],
    user_id: [user.id, user_2.id, user_3.id].sample,
    price_per_day: [13, 25, 50, 125].sample,
    category: hero_json["results"][0]["work"]['occupation'],
    publisher: hero_json["results"][0]["biography"]['publisher'],
    alignment: hero_json["results"][0]["biography"]['alignment'],
    fullname: hero_json["results"][0]["biography"]['full-name'],
    intelligence: hero_json["results"][0]["powerstats"]["intelligence"],
    strength: hero_json["results"][0]["powerstats"]["strength"],
    speed: hero_json["results"][0]["powerstats"]["speed"],
    durability: hero_json["results"][0]["powerstats"]["durability"],
    power: hero_json["results"][0]["powerstats"]["power"],
    combat: hero_json["results"][0]["powerstats"]["combat"],
    picture: hero_json["results"][0]["image"]['url']
    )
    hero.save!

end
