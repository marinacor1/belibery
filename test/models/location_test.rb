require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def valid_attributes
    {
      city: "Denver",
      state: "CO",
      country: "USA"
    }
  end

  test "it creates a location " do
    result = Location.new(valid_attributes)

    assert result.valid?
    assert_equal "Denver", result.city
    assert_equal "CO", result.state
    assert_equal "USA", result.country
  end

  test "it will not create an invalid location without city" do
    result = Location.new(    {
          state: "CO",
          country: "USA"
        })

    assert result.invalid?
  end

  test "it will not create an invalid location without state" do
    result = Location.new(    {
          city: "Denver",
          country: "USA"
        })

    assert result.invalid?
  end

  test "it will not create an invalid location without country " do
    result = Location.new(    {
          city: "Denver",
          state: "CO"
        })

    assert result.invalid?
  end

  test "it will not create a city with repetition inside a scope" do
    result = Location.create(
      city: "Bloomington",
      state: "IL",
      country: "USA"
    )
    result2 = Location.new(
      city: "Bloomington",
      state: "IN",
      country: "USA"
    )
    result3 = Location.new(
      city: "Bloomington",
      state: "IL",
      country: "USA"
    )

    assert result.valid?
    assert result2.valid?
    assert result3.invalid?
  end

  test "it will only creates two letters" do
    result1 = Location.new(
      city: "Bloomington",
      state: "IN",
      country: "USA"
    )
    result3 = Location.new(
      city: "Bloomington",
      state: "Indiana",
      country: "USA"
    )

    assert result1.valid?
    refute result3.valid?
end



end
