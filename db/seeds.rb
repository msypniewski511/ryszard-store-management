User.create!(name:  "Example User",
             email: "example@railstutoriala.org",
             password:              "foobar",
             password_confirmation: "foobar",
             status: 3)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
