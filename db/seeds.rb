def create_stuff_for(user, doctor)
  10.times do
    entry = Entry.new
    entry.user_id = user.id
    entry.date = Faker::Date.between(5.days.ago, Date.today)
    entry.value = Faker::Number.number(3)
    entry.description = Faker::Lorem.sentence
    entry.examination_type = Entry.examination_types.values.sample
    entry.save
  end

  3.times do
    alert = Alert.new
    alert.user_id = user.id
    alert.doctor_id = doctor.id
    alert.content = Faker::Lorem.sentence
    alert.save
  end
end

if User.find_by(email: 'doctor@example.com').nil?
  User.create!(
    firstname: "dr. Doctor",
    lastname: "Test Doctor",
    email: "doctor@example.com",
    password: "12345678",
    doctor: true)
end

dr_frankenstein = User.find_by(email: 'doctor@example.com')

if User.find_by(email: 'patient@example.com').nil?
  User.create!(
    firstname: "Patient",
    lastname: "Test Patient",
    email: "patient@example.com",
    password: "12345678",
    doctor_id: dr_frankenstein.id)
end

john = User.find_by(email: 'patient@example.com')
create_stuff_for(john, dr_frankenstein)

2.times do
  doctor = User.new
  doctor.email = Faker::Internet.email
  doctor.firstname = Faker::Name.first_name
  doctor.lastname = Faker::Name.last_name
  doctor.password = 12345678
  doctor.doctor = true
  doctor.doctor_id = nil
  doctor.token = Faker::Lorem.characters(20)
  doctor.save

  8.times do
    user = User.new
    user.email = Faker::Internet.email
    user.firstname = Faker::Name.first_name
    user.lastname = Faker::Name.last_name
    user.password = 12345678
    user.doctor = false
    user.doctor_id = doctor.id
    user.token = Faker::Lorem.characters(20)
    user.save

    create_stuff_for(user, doctor)
  end
end
