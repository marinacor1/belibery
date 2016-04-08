class Donation < ActiveRecord::Base
  belongs_to :fan
  validates :amount, numericality: {only_integer: true}
  validates :status, inclusion: { in: %w(pending processed cancelled)}
  validates :amount, exclusion: { within: %w(1), message: "Do not be cheap. 1 dollar is not enough."}
end
