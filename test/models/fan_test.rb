require 'test_helper'

class FanTest < ActiveSupport::TestCase
  def valid_attributes
      {
        name:               "Jorge",
        email:              "yosoybelieber@example.com",
      }
    end

  test "it creates a fan" do
    result = Fan.new(valid_attributes) #always do new instead of create to save memory

    assert result.valid?
    assert_equal "Jorge", result.name
    assert_equal "yosoybelieber@example.com", result.email
  end

  test "it cannot create a fan without an name" do
    result = Fan.new(email: "yosoybelieber@example.com")

    assert result.invalid?, "fan should be invalid"
  end

  test "it cannot create a fan with the same email" do
    2.times { Fan.create(valid_attributes) }

    result = Fan.where(email: "yosoybelieber@example.com")
    assert_equal 1, result.count
  end

  test "it only accepts letters as a name" do
    fan = Fan.new(
      name:   "Jorge1",
      email:  "yosoybelieber@example.com"
      )

    refute fan.valid?
  end

  test "it only accepts an email between 5 and 50 character" do
    fan = Fan.new(
      name: "Jorge",
      email: "Jorj"
    )
  assert fan.invalid?
end

  test "it cannot create a fan named Richard" do
    fan = Fan.new(
      name:               "Richard",
      email:              "richard@example.com"
      )

    refute fan.valid?
    assert_includes fan.errors.full_messages, "Name cannot be Richard"

  end
end
