# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

ActiveRecord::Base.transaction do
  puts "Seeding start"
  Faker::Config.locale = 'en-GB'
  
  10.times do
    profile = Profile.new
    profile.name = Faker::Name.first_name
    profile.email = Faker::Internet.email
    profile.description = Faker::Lorem.sentence
    profile.save
    5.times do
        post = Post.new
        post.title = Faker::Science.scientist
        post.description = Faker::Lorem.sentence
        post.profile_id = profile.id
        post.posted_on = Faker::Date.between(from: 3.months.ago, to: Date.today)
        post.save
    end
  end
  
  puts "Seeding ended"
end