class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def configure_devise_params
  	devise_parameter_sanitizer.for(:sign_up) do |u|
  		u.permit(:email, :password, :password_confirmation, :f_name, :l_name, :role, :bio, :phone, :address,
  			:photo, :name, :description, :website, :photo)
  	end
  end
end
