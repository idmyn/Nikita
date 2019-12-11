require "faker"

User.destroy_all
Idea.destroy_all
Pin.destroy_all

10.times do
  User.create({
    email: Faker::Internet.email,
    name: Faker::FunnyName.name,
    password_digest: Faker::Internet.password
  })
end

User.all.each do |user|
  7.times do
    user.ideas.create({
      title: Faker::Hipster.sentence,
      body: Faker::Lorem.paragraphs(number: 3).join(" ")
    })
  end

  4.times do
    Idea.all.sample.pins.create(user_id: user.id)
  end
end
