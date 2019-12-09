class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit(:email,:full_name,:password,:password_confirmation)
  end
end
