class Donation < ActiveRecord::Base
  belongs_to :fan
  validates :amount, numericality: {only_integer: true}
end
