# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts '---------------------------------------------'
puts 'Cleaning database...'
User.delete_all
puts '🎉 Success!'
puts '---------------------------------------------'

puts 'Seeding Database...'

5.times do
  User.create!(email: Faker::Internet.email,
               username: Faker::Internet.username,
               password: 'password',
               password_confirmation: 'password'
  )
end

puts '🎉 Success, users created!'
puts '---------------------------------------------'
