class Property < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode 

  validates_presence_of :name, :description, :address
end
