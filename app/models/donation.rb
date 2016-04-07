class Donation < ActiveRecord::Base
  belongs_to :fan

  scope : pending, -> { where(status: "pending")}

  # def self.pending
  #   where(status: "pending")
  # end
end
