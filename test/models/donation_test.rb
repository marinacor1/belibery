require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  valid_donation_attributes = {
    amount: 10,
    status: "paid"
  }
  test "it creates donations only if they are whole numbers" do
    result = Donation.new(valid_donation_attributes)
    result2 = Donation.new( {
      amount: 9.99,
      status: "paid"
      })

    assert result.valid?
    refute result2.valid?
  end
end
