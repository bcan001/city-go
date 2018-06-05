class RegistrationsController < Devise::RegistrationsController
	before_action :configure_permitted_parameters, if: :devise_controller?

	# def update
	# 	binding.pry

	# 	super
	# end

  # private
  protected

  # def sign_up_params
  #   params.require(:user).permit(:first_name, :last_name, :phone, :email, :username, :password, :password_confirmation)
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :email, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :email, :username])
  end


end