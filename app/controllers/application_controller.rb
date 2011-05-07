class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def redirect_away(location, msg = nil)
    session[:original_uri] = request.request_uri
    flash[:notice] = msg if msg
    redirect_to location
  end

  def redirect_back(msg = nil)
    uri = session[:original_uri]
    flash[:success] = msg if msg
    if uri
      redirect_to uri
    else
      redirect_to root_url 
    end
  end

  def admin_user
    return true if(Rails.env == "development")
    redirect_to root_path unless (current_user && current_user.admin?) 
  end


end
