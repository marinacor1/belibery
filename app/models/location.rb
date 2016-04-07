class Location < ActiveRecord::Base
  validates_presence_of :city, :state, :country
  validates :city, uniqueness: { scope: :state, message: "city and state should not be the same"}
  validates :state, length: { maximum: 2}
end
