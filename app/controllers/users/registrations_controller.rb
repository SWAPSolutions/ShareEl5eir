class Users::RegistrationsController < Devise::RegistrationsController
require 'mail'
before_filter :configure_sign_up_params, only: [:create]
before_filter :configure_account_update_params, only: [:update]
before_filter :configure_permitted_parameters           
  #GET /resource/sign_up
  def new
    super
  end



  #POST /resource
  def create
    current_registrant = params[:user][:email]
    super
    current_registrant_id = User.find_by_email(current_registrant).id
    if params[:user][:f_name] == ""
        options = { :address      => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.domain.com',
            :user_name            => 'your username',
            :password             => 'your password',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
        Mail.defaults do
          delivery_method :smtp, options
        end
        Mail.deliver do
          to 'ahmedwael2002@gmail.com'
          from 'omarsaleh0106@gmail.com'
          subject 'test email'
          body 'This is a test.'
        end
        org = Organization.new
        org.name=params[:user][:name]
        org.description=params[:user][:description]
        org.website=params[:user][:website]
        org.photo=params[:user][:photo]
        org.document=params[:user][:document]
        org.device_id= current_registrant_id
        org.save
    else
      member = Member.new
      member.f_name = params[:user][:f_name]
      member.l_name = params[:user][:l_name]
      member.bio = params[:user][:bio]
      member.phone = params[:user][:phone]
      member.address = params[:user][:address]
      member.photo = params[:user][:photo]
      member.devise_id = current_registrant_id
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

    def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:f_name, :l_name,:bio,:phone,:address,:photo, :organization)
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
