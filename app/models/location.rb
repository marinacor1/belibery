class Location < ActiveRecord::Base
  validates_presence_of :city, :state, :country
  validates :city, uniqueness: { scope: :state, message: "city and state should not be the same"}
  validates :state, length: { is: 2}
  validates :city, :state, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows upppercase and lowercase letters"}

end
