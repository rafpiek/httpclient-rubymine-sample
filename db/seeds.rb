3.times do |i|
  user = User.create(
    email: "user#{i}@email.com",
    password: 'password',
    name: Faker::Movies::StarWars.character
  )

  10.times do
    user.cars.create(
      brand: Faker::TvShows::SiliconValley.company,
      car_type: Faker::TvShows::SiliconValley.inventions,
    )
  end

  5.times do
    user.books.create(
      title: Faker::Book.title,
      author: Faker::Book.author
    )
  end
end