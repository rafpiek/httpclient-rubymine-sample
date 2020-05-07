class CarsController < ApplicationController
  def index
    user = User.find(params[:id])
    render json: user.cars
  end
end