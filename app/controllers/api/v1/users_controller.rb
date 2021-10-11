class Api::V1::UsersController < ActionController::API
  before_action :set_user, only: [ :show, :destroy ]
  wrap_parameters include: User.attribute_names + [:password, :password_confirmation]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render_error
    end
  end

  def destroy
    if request.headers["Authorization"] == ENV["API_KEY"]
      @user.destroy
      head :no_content
    else
      render_error
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
