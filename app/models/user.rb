class User
  include Mongoid::Document

  field :provider, type: String
  field :uid, type: String
  field :admin, type: Boolean


  def self.authenticate(fields)
    #auth_key = "#{fields["provider"]}_#{fields["uid"]}"
    provider = fields["provider"]
    uid =  fields["uid"]
    user = User.first(conditions: {provider: provider, uid: uid })
    if user.nil?
      user = User.new(:provider => provider, :uid => uid)
      user.send(:auth_fields=, fields["user_info"])
      user.save!
    end

    user
  end

  def auth_fields=(info)
    Rails.logger.info "FIELDS: #{info.inspect}"
    info.each_pair do |k, v|
      self[k] = v
    end
  end

  #returns true if the user is an admin
  def admin?
    self.admin
  end

end
