class PagesController < ApplicationController

  before_filter :admin_user, :only => [:admin]

  def home
    @title = "Startuplab"
  end

  def sign_in
    @title = "Sign In"
  end
  
  def admin
    @active_events = Event.all(conditions: {active: "true"})
    @unactive_events = Event.all(conditions: {active: "false"})

  end

  def contact
  end

  def help
  end

  def faq
  end
  


end
