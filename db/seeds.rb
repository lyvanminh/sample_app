User.create!(name: "abcminh01",
             email: "abcminh01@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

20.times do |n|
  name  = Faker::Name.name
  email = "abcminh-#{n+1}@gmail.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
