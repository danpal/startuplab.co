class Application
  include Mongoid::Document
  
  field :title, type: String
  belongs_to :event
  
end

