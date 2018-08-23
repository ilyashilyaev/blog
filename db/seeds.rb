# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
    {
    email:                  "admin@mail.ru",
    nickname:               "Admin",
    password:               "123456",
    password_confirmation:  "123456",
    first_name:             "Admin",
    last_name:              "Admins",
    is_admin:                true
    }

)
20.times do |i|
  User.create({
    email:                 "test#{i}@mail.ru",
    nickname:              "Name#{i}",
    password:              "123456",
    password_confirmation: "123456",
    first_name:            "Ssss#{i}",
    last_name:             "Petrov",
})
end

300.times do |i|
  Article.create({
     title:                                       "First Article#{i}",
     creator_ip_address:                          "127.0.0.#{rand(0..9)}",
     text:                                        "RailsAdmin Rollincode Theme. Gem Version.
                                                   A modern override of default bootstrap 3 rails_admin theme.
                                                   It provides news colors, adjustments and a brand",
     user:                                         User.order("RANDOM()").last
  })
end
