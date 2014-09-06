# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.all.destroy_all
Memorial.all.destroy_all
Membership.all.destroy_all
Story.all.destroy_all
Storylike.all.destroy_all

User.create!(first_name: "Some", last_name: "User", email: "some@user.com", password: "password")
User.create!(first_name: "Second", last_name: "User", email: "second@user.com", password: "password")
User.create!(first_name: "Third", last_name: "User", email: "third@user.com", password: "password")

Memorial.create!(user_id: 1, name: "Abraham Lincoln", born: (Date.today - 5000), died: (Date.today - 5))

Membership.create!(user_id: 1, memorial_id: 1)
Membership.create!(user_id: 2, memorial_id: 1)
Membership.create!(user_id: 3, memorial_id: 1)

Story.create!(user_id: 1, memorial_id: 1, story: "Gosh Abe was such a nice guy. He used to help homeless kittens get home safely.")
Story.create!(user_id: 2, memorial_id: 1, story: "He was super duper honest that is for sure!")
Story.create!(user_id: 3, memorial_id: 1, story: "I remember once when he walked five miles to bring me back a penny!")

Storylike.create!(story_id: 1, user_id: 1)
Storylike.create!(story_id: 1, user_id: 2)
Storylike.create!(story_id: 1, user_id: 3)

Storylike.create!(story_id: 2, user_id: 1)
Storylike.create!(story_id: 2, user_id: 2)

Storylike.create!(story_id: 3, user_id: 3)


