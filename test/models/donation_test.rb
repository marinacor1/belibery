require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  valid_donation_attributes = {
    amount: 10,
    status: "pending"
  }
  test "it creates donations only if they are whole numbers" do
    result = Donation.new(valid_donation_attributes)
    result2 = Donation.new( {
      amount: 9.99,
      status: "pending"
      })

    assert result.valid?
    refute result2.valid?
  end

  test "it creates donations that are processed pending or cancelled only" do
    result = Donation.new(valid_donation_attributes)
    result2 = Donation.new( {
      amount: 11,
      status: "happy"
      })
    result3 = Donation.new( {
      amount: 11,
      status: "cancelled"
      })
    result4 = Donation.new( {
      amount: 11,
      status: "processed"
      })

    assert result.valid?
    assert result2.invalid?
    assert result3.valid?
    assert result4.valid?
  end
end
