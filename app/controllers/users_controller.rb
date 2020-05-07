class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    render json: user.simple_data
  end
end