class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create]
before_filter :configure_account_update_params, only: [:update]

  #GET /resource/sign_up
  def new
    super
  end

  #POST /resource
  def create
    current_registrant = params[:user][:email]
    super
    current_registrant_id = User.find_by_email(current_registrant).id
    if params[:user][:f_name] == nil
        org = Organization.new
        org.name=params[:name]
        org.description=params[:description]
        org.website=params[:website]
        org.photo=params[:photo]
        org.device_id= current_registrant_id
        org.save
    else
      member = Member.new
      member.f_name = params[:f_name]
      member.l_name = params[:l_name]
      member.bio = params[:bio]
      member.phone = params[:phone]
      member.address = params[:address]
      member.photo = params[:photo]
      member.save
    end
  end

  #GET /resource/edit
  def edit
    super
  end

  #PUT /resource
  def update
    super
  end

  #DELETE /resource
  def destroy
    super
  end

  #GET /resource/cancel
  #Forces the session data which is usually expired after sign
  #in to be expired now. This is useful if the user wants to
  #cancel oauth signing in/up in the middle of the process,
  #removing all OAuth session data.
  def cancel
    super
  end

  protected

  #If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :attribute
  end

  #If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :attribute
  end

  #The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  #The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
