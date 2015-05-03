class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username,:email,:password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:username, :email, :password_confirmation, :age, :gender, :bio, :current_password)
  end


end
