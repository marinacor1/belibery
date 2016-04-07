class Fan < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :name,  presence:   true,
                    format:     { with: /\A[a-zA-Z]+\z/, message: "only allows uppercase and lowercase letters"}
                    #adds message to let user know why it didn't work
                    #errors don't happen unless you save it
  validates :email, presence:   true,
                  uniqueness: true,
                  length:     { in: 5..50 }
  validate :no_richards

  def no_richards
    if name.to_s.downcase == "richard"
      errors.add(:name, "cannot be Richard") if name == "Richard"
    end
  end
                    # validates_presence_of :name, :email
  # validates: name, presence: true
end
