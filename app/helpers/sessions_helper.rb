module SessionsHelper

  def current_user
    if(@current_user.nil? && session[:user_id])
      #check first if the users exist's so as to not 
      if(User.exists?(:conditions => {:id => session[:user_id]}))
        @current_user = User.find(session[:user_id])
      end
    end

    return @current_user
  
  end

  def current_user?(user)
    user == current_user
  end

  def sign_in(user)
    session[:user_id] = user.id
    current_user = user
  end

  def sign_out
    session[:user_id] = nil
    current_user = nil
  end

  def signed_in?
    !!current_user
  end

  def current_user=(user)
    @current_user = user
  end

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    redirect_away signin_path, "You need to sign in"
  end


end

