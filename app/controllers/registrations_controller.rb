class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)

  end

  def update_user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :current_password, :age, :bio, :gender)
  end


end
