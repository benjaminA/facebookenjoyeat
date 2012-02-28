class SessionsController < ApplicationController
  
  
  def authorize
    respond_to do|format|
      format.html # authorize.html.erb
    end
    
  end
  def create
  
   #raise request.env["omniauth.auth"].to_yaml
  auth = request.env["omniauth.auth"]
  #user = User.find_by_fb_uid_and_fb_token(auth["uid"], auth["credentials"]["token"]) || User.create_with_omniauth(auth)
  user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  
  session[:user_id] = user.id
  redirect_to root_path, :notice => "Signed in!"
  end

  def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Signed out!"
  end
end
