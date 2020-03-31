class Api::V1::UsersController < Api::V1::CoreController
  before_action :verify_user_params

  def show
    if current_user
      format.json { render show: @user, status: :created }
    else
      render json: {}, status: 422
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      format.json { render show: @user, status: :created }
    else
      render json: @user.errors, status: 422
    end
  end

  def reset_password
    @user = User.find_by(email: params[:email])
    if @user.present?
      new_password = Devise.friendly_token(8)
      @user.update_attributes(password: new_password, password_confirmation: new_password)
      
      render json: { status: "Your password has been reset" }
    else
      render json: { status: "Email not found" }
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      render json: user, serializer: serializer
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def verify_user_params
    params[:user] = {name: "", email: "", password: "", password_confirmation: ""} unless params[:user].present?
  end

end
