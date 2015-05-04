# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "do0fusz", email: "do0fusz@hotmail.com", password: "cupertino2010", password_confirmation: "cupertino2010")

50.times do 
  username = Faker::Name.name
  password = "foobarbaz"
  User.create!(
    username: username,
    email: username.gsub(' ','_') +"@hotmail.com",
    password: password,
    password_confirmation: password)
end


p "Test users created"