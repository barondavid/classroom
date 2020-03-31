class Api::V1::SessionsController < Api::V1::CoreController
  before_action :authenticate_with_token!, only: [:relogin]

  def create
    user_password = params[:password]
    user_email    = params[:email]

    @user = user_email.present? && User.find_by(email: user_email)

    respond_to do |format|

      if @user && @user.valid_password?(user_password)
        sign_in @user
        if !@user.auth_token.present?
          @user.generate_authentication_token
          @user.save
        end
        
        format.json { render json: @user, status: :created }
      else
        
        render json: { errors: "Invalid Email or Password" }, status: 422

      end

    end


  end

  def relogin
    respond_to do |format|
      format.json { render json: @user, status: :created }
    end
  end

  def destroy
    head 204
  end

end