# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Environment variables (ENV['...']) can be set in the file .env file.

2.times do
  doctor = User.new
  doctor.email = Faker::Internet.email
  doctor.firstname = Faker::Name.first_name
  doctor.lastname = Faker::Name.last_name
  doctor.password = Faker::Internet.password(8)
  doctor.doctor = true
  doctor.doctor_id = nil
  doctor.save

  8.times do
    user = User.new
    user.email = Faker::Internet.email
    user.firstname = Faker::Name.first_name
    user.lastname = Faker::Name.last_name
    user.password = Faker::Internet.password(8)
    user.doctor = false
    user.doctor_id = doctor.id
    user.save

    10.times do
      entry = Entry.new
      entry.user_id = user.id
      entry.date = Faker::Date.between(5.days.ago, Date.today)
      entry.value = Faker::Number.number(3)
      entry.description = Faker::Lorem.sentence
      entry.examination_type = Entry.examination_types.values.sample
      entry.save
    end
  end
end