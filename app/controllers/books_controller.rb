class BooksController < ApplicationController
  def index
    user = User.find(params[:id])
    render json: user.books
  end
end