require 'openid/store/filesystem'

TW_CONSUMER_KEY = ENV['TWITTER_CONSUMER_KEY'] 
TW_SECRET_KEY = ENV['TWITTER_SECRET_KEY'] 

FB_APP_KEY = ENV['FACEBOOK_APP_KEY'] 
FB_SECRET_KEY = ENV['FACEBOOK_SECRET_KEY']

Rails.application.config.middleware.use OmniAuth::Builder do  


  #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'   
  #provider :twitter, 'ifWy1blJ4SIwlxqb6srDg', 'zLVmcThkeE7MVzApIl3gBgDngpOcq1H94Hw3MRLVc4'  
  provider :twitter, TW_CONSUMER_KEY, TW_SECRET_KEY 

  #provider :facebook , 'app' , 'secret' , {:scope => "manage_pages"}
  provider :facebook , FB_APP_KEY , FB_SECRET_KEY, {:scope => "email"}

  provider :openid, nil, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'

end  

