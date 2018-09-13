require("minitest/autorun")
require("minitest/rg")
require_relative("../food")

class TestFood < MiniTest::Test

  def setup

    @food1 = Food.new("Cheese Burger", 3.5, 5)

  end

  def test_has_name()
    assert_equal("Cheese Burger", @food1.name())
  end

  def test_has_price()
    assert_equal(3.5, @food1.price())
  end

  def test_has_rejuv_level()
    assert_equal(5, @food1.rejuvenation_level())
  end

end
