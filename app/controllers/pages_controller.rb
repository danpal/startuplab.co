class PagesController < ApplicationController

  before_filter :admin_user, :only => [:admin]

  def home
    @title = "Startuplab"
  end

  def sign_in
    @title = "Sign In"
  end
  
  def admin
    @events = Event.all

  end

  def contact
  end

  def help
  end

  def faq
  end
  


end
