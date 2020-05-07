class User < ApplicationRecord
  has_many :cars
  has_many :books

  def as_json(opts = {})
    super.merge({
      books: self.books,
      cars: self.cars
    })
  end

  def simple_data
    {
      user: {
        name: name,
        email: email,
      },
      books_count: self.books.size,
      cars_count: self.cars.size
    }.to_json
  end
end
