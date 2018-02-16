
7.times do 
    Subject.create!(
    name: Faker::Lorem.word, 
)
end

subjects = Subject.all


21.times do
    Topic.create!(
    subject: subjects.sample,
    title: Faker::Lorem.word,
)
end

topics = Topic.all

user = User.create!(
    email: 'twr349@gmail.com', 
    password: 'password',
    confirmed_at: Time.now
)
user.save!

user2 = User.create!(
    email: 'user2@mail.com',
    password: 'password',
    confirmed_at: Time.now
)
user2.save!

users = User.all

puts "Seed finished"
puts "#{Topic.count} topics created!"
puts "#{Subject.count} subjects created!"
puts users
