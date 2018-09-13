require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")

class TestDrink < MiniTest::Test

  def setup

  @drink1 = Drink.new("Lager", 3.5, 3.0)

  end

  def test_has_name()
    assert_equal("Lager", @drink1.name())
  end

  def test_has_price()
    assert_equal(3.5, @drink1.price())
  end

  def test_has_alcohol_level()
    assert_equal(3.0, @drink1.alcohol_level())
  end

end
