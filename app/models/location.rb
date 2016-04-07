class Location < ActiveRecord::Base
  validates_presence_of :city, :state, :country
end
