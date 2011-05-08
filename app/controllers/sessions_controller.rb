class SessionsController < ApplicationController

  def create 
    #puts request.env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]  
    user = User.authenticate(auth)  
    sign_in(user)
    redirect_to user_path(user), :flash => {:success => "Signed in"}
  end

  def destroy
    name = current_user.name
    sign_out
    redirect_to root_url, :notice => 'Signed out'
  end

end

