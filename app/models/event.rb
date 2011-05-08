class Event
  include Mongoid::Document

  field :name, type: String
  field :schedule, type: String
  field :description, type: String
  field :active, type: Boolean, default: true
  key :name

  has_many :applications





end
