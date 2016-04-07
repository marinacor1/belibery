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
    result2 = Location.new(
      city: "Bloomington",
      state: "N",
      country: "USA"
    )
    result3 = Location.new(
      city: "Bloomington",
      state: "Indiana",
      country: "USA"
    )

    assert result1.valid?
    refute result2.valid?
    refute result3.valid?
end

  test "it will not accept cities or state with special characters" do
    result1 = Location.new(
      city: "!Bloomington",
      state: "IN",
      country: "USA"
    )
    result2 = Location.new(
      city: "Bl2oomington",
      state: "Indiana",
      country: "USA"
    )
    result3 = Location.new(
      city: "Bloomington",
      state: "Indi@ana",
      country: "USA"
    )
    result4 = Location.new(
      city: "Bloomington",
      state: "India2na",
      country: "USA"
    )
    result5 = Location.new(
      city: "bloomington",
      state: "In",
      country: "USA"
    )
    result6 = Location.new(
      city: "Bloomington",
      state: "in",
      country: "USA"
    )
    result7 = Location.new(
      city: "Bl oomington",
      state: "in",
      country: "USA"
    )

    assert result1.invalid?
    assert result2.invalid?
    assert result3.invalid?
    assert result4.invalid?
    assert result5.valid?
    assert result6.valid?
    assert result7.valid?
  end


end
