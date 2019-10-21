require "faker"
10.times do
  User.create({
    email: Faker::Internet.email,
    name: Faker::FunnyName.name,
    password_digest: Faker::Internet.password
  })
end

User.all.each do |user|
  2.times do
    user.ideas.create({
      title: Faker::Hipster.sentence,
      body: Faker::Lorem.paragraphs(number: 3).join(" ")
    })
  end
end
