class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
  #   super
    client_email = params[:user][:email]
    email_domain = client_email.split("@").last
    google_authenticator = GoogleAuthenticationService.new
    if email_domain == "miuandes.cl"
      client_password = params[:user][:password]
      if google_authenticator.authenticate(client_email,client_password)
        redirect_google_authorized_user(client_email)
      else
        redirect_google_unauthorized_user
      end  
    else
      authenticate_user_with_devise
    end
  end

  private

  def redirect_google_authorized_user(email)
    self.resource = User.find_by email: email
    flash[:notice] = "Signed in successfully"
    sign_in(:user,resource)
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def redirect_google_unauthorized_user
    flash[:notice] = "Credentials were incorrect"
    respond_with nil, location: new_user_session_path
  end

  def authenticate_user_with_devise
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
