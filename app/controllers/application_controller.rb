class ApplicationController < ActionController::API
  before_action :authenticate, except: [:home, :all_data, :login]
  FAKE_TOKEN = "RubyIsAwesome!!!!!<3"

  def home
    render json: { message: 'Api works' }, status: 200
  end

  def all_data
    users = User.all.includes(:books, :cars)

    render json: users
  end

  def login
    user = User.find_by(email: params[:email])
    if user.present? && user.password.eql?(params[:password])
      render json: {
        user: user.simple_data,
        auth_token: FAKE_TOKEN,
      }, status: :ok
    else
      render json: { error: :unathorized }, status: :unathorized
    end
  end

  private
  def authenticate
    if request.headers['Authentication'] && request.headers['Authentication'].split(' ').last.eql?(FAKE_TOKEN)
      return
    else
      render json: { error: :unathorized }, status: :unauthorized
    end
  end
end
